import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<User?> signUp(String email, String password);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
  Future<void> sendEmailVerification();
  Future<void> forgotPassword(String email, [String langCode = "tr"]);
}
