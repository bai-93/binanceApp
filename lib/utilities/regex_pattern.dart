class RegexPattern {
  static bool emailValidator(String value) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value);
  }
}
