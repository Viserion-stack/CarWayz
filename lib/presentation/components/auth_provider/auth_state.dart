enum AuthStateType { logged, initial }

class AuthState {
  final AuthStateType authStateType;

  AuthState({required this.authStateType});

  const AuthState.initial() : authStateType = AuthStateType.initial;

  AuthState copyWith({
    AuthStateType? authStateType,
  }) {
    return AuthState(
      authStateType: authStateType ?? this.authStateType,
    );
  }
}
