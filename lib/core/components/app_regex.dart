class AppRegexValidator {
  static final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );

  static final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
  );

  static bool isValidEmail(String email) {
    return emailRegex.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return passwordRegex.hasMatch(password);
  }
}