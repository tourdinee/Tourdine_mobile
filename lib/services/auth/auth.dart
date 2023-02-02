import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tourdine/firebase_options.dart';

import '../../models/auth_user.dart';
import 'auth_exception.dart';
import 'authentication.dart';

class Auth extends Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<AuthUser> createAccount(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthUser.fromFirebase(credential.user!);
    } on SocketException {
      throw NetworkFailedException();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          throw EmailAlreadyExitException();
        case "invalid-email":
          throw InvalidEmailException();
        case "weak-password":
          throw WeakPasswordException();
        default:
          throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<AuthUser> login(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthUser.fromFirebase(credential.user!);
    } on SocketException {
      throw NetworkFailedException();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "wrong-password":
        case "user-not-found":
        case "invalid-email":
          throw InvalidCredentialException();
        default:
          throw GenericAuthException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException {
      throw ResetPasswordErrorException();
    } catch (e) {
      throw ResetPasswordErrorException();
    }
  }

  @override
  AuthUser? get currentUser => (auth.currentUser != null)
      ? AuthUser.fromFirebase(auth.currentUser!)
      : null;

  @override
  Future<void> sendEmailVerification({required String email}) async {
    if (currentUser != null) {
      await auth.currentUser!.sendEmailVerification();
    } else {
      throw UserNotLoggedinException();
    }
  }

  @override
  Future<void> deleteAccount({required String email}) async {
    if (currentUser != null) {
      try {
        await auth.currentUser!.delete();
      } on FirebaseAuthException catch (e) {
        if (e.code == "requires-recent-login") {
          throw UserNeedToLoginAuthenticateException();
        }
      }
    } else {
      throw UserNotLoggedinException();
    }
  }
}
