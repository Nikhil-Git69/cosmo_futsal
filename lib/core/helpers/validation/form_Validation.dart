class formValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid Email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    if (value.trim().length < 8) {
      return 'Password must be exactly 8 characters long';
    }

    return null;
  }



  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email or Username is required';
    }

    final usernameRegex = RegExp(r'^[a-zA-Z0-9._-]{3,20}$');

    if (!usernameRegex.hasMatch(value.trim())) {
      return 'Username must be 3-20 characters and contain only letters, numbers, dots, underscores or hyphens';
    }

    return null;
  }
}
