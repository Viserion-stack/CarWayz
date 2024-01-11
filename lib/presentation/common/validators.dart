String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty || !value.contains('@')) {
    return 'Please enter valid email adress.';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.trim().length < 6) {
    return 'Enter least 6 characters.';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  if (value != password) {
    return 'Passowrd did not match.';
  }
  return null;
}
