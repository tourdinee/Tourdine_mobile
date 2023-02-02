import 'package:shared_preferences/shared_preferences.dart';

class SaveLocal {
  Future<void> saveUser(User user) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString("user-name", user.name);
    await pref.setString("user-email", user.email);
    await pref.setString("user-id", user.id);
  }

  void removeUser() async {
    final pref = await SharedPreferences.getInstance();

    await pref.remove("user-name");
    await pref.remove("user-email");
    await pref.remove("user-id");
  }

  Future<User?> getUserData() async {
    final pref = await SharedPreferences.getInstance();

    final email = pref.getString("user-email");
    final id = pref.getString("user-id");
    final name = pref.getString("user-name");
    return User(id: id ?? "", name: name ?? "", email: email ?? "");
  }
}

class User {
  final String id;
  final String name;
  final String email;
  List<String> favorite = [];

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}
