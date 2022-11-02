import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/login_screen.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfffdfdfd),
        iconTheme: const IconThemeData(),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: const Color(0xff000000),
                textStyle: textStyle1.copyWith(color: Colors.black87))),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: titleTextStyle,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
