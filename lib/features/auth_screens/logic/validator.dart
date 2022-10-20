String? validate(String? value, String hintText) {
  if (hintText == "Email") {
    RegExp expression = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
    return expression.hasMatch(value!) ? null : "enter a valid email";
  }

  if (hintText == "Password") {
    return value!.length >= 6 ? null : "enter a valid password";
  }

  if (hintText == "Display Name") {
    return value!.length >= 2 ? null : "enter a valid display name";
  }

  return null;
}
