import 'package:tourdine/models/auth_user.dart';

abstract class Authentication {
  const Authentication();

  AuthUser? get currentUser;

  Future<void> initialize();

  Future<AuthUser> login({
    required String email,
    required String password,
  });

  Future<AuthUser> createAccount({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> sendEmailVerification({required String email});

  Future<void> resetPassword({required String email});

  Future<void> deleteAccount({required String email});
}
