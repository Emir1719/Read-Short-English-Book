// ignore_for_file: depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/data/dependency/auth_dependency.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';
import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/navigation/bloc/nav_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

final class AppInit {
  static final _instance = AppInit._();

  AppInit._();

  factory AppInit() => _instance;

  static Future setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    setupDependencies();
  }

  static List<SingleChildWidget> getBlocProviders() {
    return [
      BlocProvider(create: (context) => ReadingBloc()..add(LoadAllStories())),
      BlocProvider(create: (context) => NavBloc()),
      BlocProvider(create: (context) => DictionaryBloc(getIt<IDictionaryRepository>())),
      BlocProvider(
        create: (context) => AuthenticationBloc(
          getIt<IAuthenticationRepository>(),
          getIt<IFirestoreRepository>(),
        )..add(AppStarted()),
      )
    ];
  }
}
