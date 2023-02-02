import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/login_screen.dart';
import 'package:tourdine/features/home/home_bottom_nav_bar.dart';
import 'package:tourdine/firebase_options.dart';
import 'package:tourdine/services/auth/auth_service.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
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
            textStyle: textStyle1.copyWith(color: Colors.black87),
          ),
        ),
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
      home: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.fromFirebase().currentUser;
              if (user != null) {
                return const HomeBottomNavBar();
              } else {
                return const LoginScreen();
              }
            default:
              return const CircularProgressIndicator();
          }
        },
        // (context) {
        //   return const LoginScreen();
        // }
      ),
    );
  }
}
