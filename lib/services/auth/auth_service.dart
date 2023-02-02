import 'package:tourdine/models/auth_user.dart';
import 'package:tourdine/services/auth/auth.dart';
import 'package:tourdine/services/auth/authentication.dart';

class AuthService extends Authentication {
  final Authentication authentication;

  const AuthService(this.authentication);

  factory AuthService.fromFirebase() => AuthService(Auth());

  @override
  AuthUser? get currentUser => authentication.currentUser;

  @override
  Future<AuthUser> createAccount(
          {required String email, required String password}) =>
      authentication.createAccount(email: email, password: password);

  @override
  Future<void> initialize() => authentication.initialize();

  @override
  Future<AuthUser> login({required String email, required String password}) =>
      authentication.login(email: email, password: password);

  @override
  Future<void> logout() => authentication.logout();

  @override
  Future<void> resetPassword({required String email}) =>
      authentication.resetPassword(email: email);

  @override
  Future<void> sendEmailVerification({required String email}) =>
      authentication.sendEmailVerification(email: email);

  @override
  Future<void> deleteAccount({required String email}) =>
      authentication.deleteAccount(email: email);
}
