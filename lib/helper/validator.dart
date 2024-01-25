class Validator {
  static String? stringValidation(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the value of ${fieldName ?? "this field."}';
    }
    return null;
  }
}
