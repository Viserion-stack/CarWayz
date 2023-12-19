import 'package:car_wayz/core/constants/firebase_constants.dart';
import 'package:car_wayz/core/constants/type_defs.dart';
import 'package:car_wayz/core/failure.dart';
import 'package:car_wayz/core/providers/firebase_providers.dart';
import 'package:car_wayz/data/model/community_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod/riverpod.dart';

final communityRepositoryProvider = Provider((ref) {
  return CommunityRepository(firestore: ref.watch(firestoreProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firebaseFirestore;
  CommunityRepository({required FirebaseFirestore firestore})
      : _firebaseFirestore = firestore;

  FutureVoid createCommunity(Community community) async {
    try {
      var communityDoc = await _communities.doc(community.name).get();
      if (communityDoc.exists) {
        throw 'Community with the same name already exists!';
      }
      return right(_communities.doc(community.name).set(community.toMap()));
    } on FirebaseException catch (e) {
      return left(Failure(e.message!.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Community>> getUserCommunities(String uid) {
    return _communities
        .where('members', arrayContains: uid)
        .snapshots()
        .map((event) {
      List<Community> communities = [];
      for (var doc in event.docs) {
        communities.add(Community.fromMap(doc.data() as Map<String, dynamic>));
      }
      return communities;
    });
  }

  CollectionReference get _communities =>
      _firebaseFirestore.collection(FirebaseConstants.communitiesCollection);
}
