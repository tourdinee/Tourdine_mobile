// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String id;
  final String email;
  final bool isVerified;
  AuthUser({
    required this.id,
    required this.email,
    required this.isVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isVerified: user.emailVerified,
      );
}
