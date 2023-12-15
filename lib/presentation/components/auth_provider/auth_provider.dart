import 'package:car_wayz/data/model/user.dart';
import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_state.dart';

import '../../../data/repository/authentication.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepo = AuthRepository();

  return AuthNotifier(const AuthState.initial(), authRepo);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository auth;
  AuthNotifier(super.sate, this.auth);

  Future<void> onInitiated() async {
    auth.user.listen((user) {
      if (user == User.empty) {
        state = state.copyWith(authStateType: AuthStateType.unauthenticated);
      } else {
        state = state.copyWith(authStateType: AuthStateType.authenticated);
        debugPrint('Zalogowano ${user.email}');
      }
    });
  }

  Future<void> logIn(String email, String password) async {
    await auth.logInWithEmailAndPassword(email: email, password: password);
  }
  Future<void> signUp(String email, String password) async {
    await auth.createUser(email: email, password: password);
  }

  Future<void> logout() async {
    auth.logOut();
  }
}
