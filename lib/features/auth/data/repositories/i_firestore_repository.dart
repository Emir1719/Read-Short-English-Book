import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirestoreRepository {
  Future<bool> saveUser(User firebaseUser, String age);
  Future<AppUser?> getCurrentUser(String userId);
}
