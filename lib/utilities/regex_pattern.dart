class RegexPatternUtility {
  static bool emailValidator(String value) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value);
  }

  static bool passwordValidator(String value) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[\W]).{8,}$')
        .hasMatch(value);
  }
}
