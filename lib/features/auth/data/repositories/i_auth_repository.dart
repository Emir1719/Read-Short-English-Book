import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthenticationRepository {
  Future<User?> signUp(String email, String password);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
}
