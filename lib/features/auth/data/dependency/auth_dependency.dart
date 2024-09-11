// get_it singleton'ı oluşturuyoruz
import 'package:english_will_fly/features/auth/data/repositories/firebase_auth.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // FirebaseAuth bağımlılığını sağla
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => FirebaseAuthenticationRepository(FirebaseAuth.instance),
  );
}
