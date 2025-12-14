class FormValidators {
  static String removeSpaces(String value) => value.replaceAll(' ', '');

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    value = value.trim();
    if (!RegExp(r'^[A-Za-z]+(?: [A-Za-z]+)*$').hasMatch(value)) {
      return 'Only letters and single spaces allowed';
    }
    if (value.length < 2 || value.length > 30) {
      return 'Name must be 2–30 characters';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    value = removeSpaces(value);
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.contains(' ')) return 'No spaces allowed';
    if (value.length < 8) return 'Min 8 characters required';
    if (!RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
    ).hasMatch(value)) {
      return 'Must contain upper, lower, number & special char';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number required';
    value = removeSpaces(value);
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) return 'Confirm your password';
    if (value != originalPassword) return 'Passwords do not match';
    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) return 'OTP is required';
    value = removeSpaces(value);
    if (!RegExp(r'^[0-9]{4}$').hasMatch(value)) {
      return 'OTP must be exactly 4 digits';
    }
    return null;
  }
}
