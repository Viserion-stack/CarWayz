enum AuthStateType { authenticated, unauthenticated }

class AuthState {
  final AuthStateType authStateType;

  AuthState({required this.authStateType});

  const AuthState.initial() : authStateType = AuthStateType.unauthenticated;

  AuthState copyWith({
    AuthStateType? authStateType,
  }) {
    return AuthState(
      authStateType: authStateType ?? this.authStateType,
    );
  }
}
