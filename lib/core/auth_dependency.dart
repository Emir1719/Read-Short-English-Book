// get_it singleton'ı oluşturuyoruz
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/core/app_text_to_speech.dart';
import 'package:english_will_fly/features/auth/data/repositories/firebase_auth.dart';
import 'package:english_will_fly/features/auth/data/repositories/firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/dictionary/data/datasources/dictionary_api.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';
import 'package:english_will_fly/features/dictionary/domain/repositories/dictionary_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future setupDependencies() async {
  // FirebaseAuth bağımlılığını sağla
  getIt.registerLazySingleton<IAuthenticationRepository>(
    () => FirebaseAuthenticationRepository(FirebaseAuth.instance),
  );

  getIt.registerLazySingleton<IFirestoreRepository>(
    () => FirestoreRepository(FirebaseFirestore.instance, FirebaseAuth.instance),
  );

  getIt.registerLazySingleton<IDictionaryRepository>(
    () => DictionaryRepository(api: DictionaryApi()),
  );

  getIt.registerLazySingleton<AppTextToSpeech>(() => AppTextToSpeech());
}
