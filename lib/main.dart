import 'package:flutter/material.dart';
import 'package:tourdine/features/auth_screens/login_screen.dart';
import 'package:tourdine/features/screens/otp_page.dart';
import 'package:tourdine/features/screens/welcome_page.dart';
import 'package:tourdine/features/auth_screens/signup_screen.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
