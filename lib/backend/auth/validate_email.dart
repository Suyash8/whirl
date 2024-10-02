class ValidateEmail {
  String? validate(String? email) {
    if (email?.isEmpty ?? true) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email!)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}