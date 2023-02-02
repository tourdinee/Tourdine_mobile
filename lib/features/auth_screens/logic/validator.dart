import 'dart:developer';

String? validate(String? value, String hintText, [String? confirmText]) {
  if (hintText == "Email") {
    log("email Validator called");
    RegExp expression = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return expression.hasMatch(value!) ? null : "enter a valid email";
  }

  if (hintText == "Password") {
    log("Password Validator called");
    return value!.length >= 6 ? null : "enter a valid password";
  }

  if (hintText == "Display Name") {
    log("Dispaly Validator called");
    return value!.length >= 2 ? null : "enter a valid display name";
  }

  if (hintText == "Confirm Password") {
    log("Confirm Validator called");
    return value == confirmText ? null : "not same as password";
  }

  return null;
}
