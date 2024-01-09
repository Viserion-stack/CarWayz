import 'package:car_wayz/core/utils.dart';
import 'package:car_wayz/data/auth_controller.dart';
import 'package:car_wayz/data/model/community_model.dart';
import 'package:car_wayz/data/repository/community.dart';
import 'package:car_wayz/export.dart';

final userCommunitiesProvider = StreamProvider((ref) {
  final communityController = ref.watch(communityControllerProvider.notifier);
  return communityController.getUserCommunities();
});
final allCommunitiesProvider = StreamProvider((ref) {
  final communityController = ref.watch(communityControllerProvider.notifier);
  return communityController.getAllCommunities();
});

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final communityRepository = ref.watch(communityRepositoryProvider);
  return CommunityController(
      communityRepository: communityRepository, ref: ref);
});

final getCommunityByNameProvider = StreamProvider.family((ref, String name) {
  return ref
      .watch(communityControllerProvider.notifier)
      .getCommunityByName(name);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref;

  CommunityController(
      {required CommunityRepository communityRepository, required Ref ref})
      : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ?? '';
    Community community = Community(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avatar: Constants.avatarDefault,
      members: [uid],
      mods: [uid],
      likes: [],
      saved: [],
    );
    final res = await _communityRepository.createCommunity(community);
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Cmmunity created successfully');
    });
  }

  Stream<List<Community>> getUserCommunities() {
    final uid = _ref.read(userProvider)!.uid;
    return _communityRepository.getUserCommunities(uid);
  }

  Stream<Community> getCommunityByName(String name) {
    return _communityRepository.getCommunityByName(name);
  }

  Stream<List<Community>> getAllCommunities() {
    return _communityRepository.getAllCommunities();
  }

  Future<void> updateLikeCount(String communityName) async {
    final uid = _ref.read(userProvider)!.uid;

    final res = await _communityRepository.updateLikeCount(communityName, uid);

    res.fold((l) => (), (r) {});
  }
}
