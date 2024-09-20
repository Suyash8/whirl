class ValidatePassword {
  String? validate(String? password) {
    if (password?.isEmpty ?? true) {
      return 'Password is required';
    }
    if (password!.length < 6) {
      return 'Password is at least 6 characters';
    }
    return null;
  }
}