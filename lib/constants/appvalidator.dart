class appvalidator {
  static emailvalidator(String email) {
    if (email.isEmpty) {
      return "E-mail is empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      //r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
      return "Enter valid Email";
    }
    return null;
  }

  static passwordvalidator(String password) {
    if (password.isEmpty) {
      return "Password is empty";
    } else if (password.length < 6) {
      return "Add more than 6 numbers";
    }
    return null;
  }

  static passwordrepeatvalidator(String password, String repeatpassword) {
    if (repeatpassword != password) {
      return "Password not same";
    } else if (repeatpassword.isEmpty) {
      return "Password is empty";
    }
    return null;
  }

  static username(String username) {
    if (username.isEmpty) {
      return "user is empty";
    }
    return null;
  }
}
