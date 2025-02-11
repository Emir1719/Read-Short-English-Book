import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirestoreUser {
  Future<bool> saveUser(User firebaseUser);
  Future<AppUser?> getCurrentUser(String userId);
}
