// get_it singleton'ı oluşturuyoruz
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/core/app_text_to_speech.dart';
import 'package:english_will_fly/core/app_translator.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_reading.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_wordlist.dart';
import 'package:english_will_fly/features/auth/data/repository_impl/firebase_auth.dart';
import 'package:english_will_fly/features/auth/data/repository_impl/firestore_reading.dart';
import 'package:english_will_fly/features/auth/data/repository_impl/firestore_user.dart';
import 'package:english_will_fly/features/auth/data/repository_impl/firestore_wordlist.dart';
import 'package:english_will_fly/features/dictionary/data/datasources/dictionary_api.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';
import 'package:english_will_fly/features/dictionary/domain/repositories/dictionary_repository.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/settings_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

final getIt = GetIt.instance;

Future setupDependencies() async {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  // Firebase bağımlılığı
  getIt.registerLazySingleton<IAuthRepository>(() => FirebaseAuthRepository(auth));
  getIt.registerLazySingleton<IFirestoreUser>(() => FirestoreUser(firestore));
  getIt.registerLazySingleton<IFirestoreWordlist>(() => FirestoreWordlist(firestore, auth));
  getIt.registerLazySingleton<IFirestoreReading>(() => FirestoreReading(firestore, auth));

  // Dictionary
  getIt.registerLazySingleton<IDictionaryRepository>(
    () => DictionaryRepository(api: DictionaryApi()),
  );

  // text_to_speech and translator
  getIt.registerLazySingleton<AppTextToSpeech>(() => AppTextToSpeech());

  final tra = GoogleTranslator();
  getIt.registerLazySingleton<AppTranslator>(() => AppTranslator(tra));

  // shared pref
  final sharedPrefs = await SharedPreferences.getInstance();
  final settingsRepository = SettingsRepository(prefs: sharedPrefs);

  getIt.registerLazySingleton<SettingsRepository>(() => settingsRepository);
}
