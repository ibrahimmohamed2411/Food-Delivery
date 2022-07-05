String? emailValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        !value.contains('@') ||
        !value.contains('.')) {
      return 'Invalid Email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid Password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  String ? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invalid Name';
    }
    return null;
  }