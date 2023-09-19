class ValidChecker{
  static bool isValidNumber(String input) {
    // Implement your number validation logic here
    return double.tryParse(input) != null;
  }

  static bool isValidEmail(String input) {
    // Implement your email validation logic here
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(input);
  }
}