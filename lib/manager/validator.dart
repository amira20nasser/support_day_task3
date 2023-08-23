
class Validator {
  Validator._();
  static String? validatorName(String? value) {
    return ((value?.length ?? 0) == 0) ? "Empty Field" : null;
  }

  static String? validateEmail(String? email) {
    bool validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email ?? "");
    if (!validEmail) {
      return 'This is invalid Address';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    bool validPassword = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
        .hasMatch(password ?? "");

    if (!validPassword) {
      return 'at least one letter,one digit,more than 8 characters';
    }
    return null;
  }
}
