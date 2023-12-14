import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/components/auth_provider/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(const AuthState.initial()),
);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(super.sate);

  void onInitiated() {
    state = state.copyWith(authStateType: AuthStateType.logged);
  }
}
