import 'package:tourdine/models/auth_user.dart';
import 'package:tourdine/services/auth/authentication.dart';

class AuthService extends Authentication {
  final Authentication authentication;

  AuthService(this.authentication);

  @override
  AuthUser? get currentUser => authentication.currentUser;

  @override
  Future<AuthUser> createAccount(
      {required String email, required String password}) {
    return authentication.createAccount(email: email, password: password);
  }

  @override
  Future<void> initialize() {
    return authentication.initialize();
  }

  @override
  Future<AuthUser> login({required String email, required String password}) {
    return authentication.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return authentication.logout();
  }

  @override
  Future<void> resetPassword({required String email}) {
    return authentication.resetPassword(email: email);
  }

  @override
  Future<void> sendEmailVerification({required String email}) {
    return authentication.sendEmailVerification(email: email);
  }
}
