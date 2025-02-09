import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirestoreRepository {
  Future<bool> saveUser(User firebaseUser);
  Future<AppUser?> getCurrentUser(String userId);

  // TODO: interfaceyi ayır
  Future<bool> saveWordToList(String word);
  Future<bool> removeWordFromList(String word);
  Future<WordList?> getAllWordFromList();
}
