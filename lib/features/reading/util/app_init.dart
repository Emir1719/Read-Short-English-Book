// ignore_for_file: depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/view/auth/login_view.dart';
import 'package:english_will_fly/features/auth/presentation/view/auth/sign_up_view.dart';
import 'package:english_will_fly/features/auth/presentation/view/splash/splash_view.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';
import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/navigation/bloc/nav_bloc.dart';
import 'package:english_will_fly/features/navigation/view/nav_view.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/stories/stories_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/story_introduction/story_introduction_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/story_read/story_read_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/word_detail/word_detail_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/word_list/word_list_view.dart';
import 'package:english_will_fly/features/theme/data/theme_storage.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:english_will_fly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await ThemeStorage().init();
    EasyLocalization.logger.enableBuildModes = [];
    await setupDependencies();
  }

  static List<SingleChildWidget> getBlocProviders() {
    return [
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (context) => ReadingBloc()..add(LoadAllStories())),
      BlocProvider(create: (context) => NavBloc()),
      BlocProvider(create: (context) => StoryReadBloc()),
      BlocProvider(create: (context) => DictionaryBloc(getIt<IDictionaryRepository>())),
      BlocProvider(
        create: (context) => AuthBloc(
          getIt<IAuthenticationRepository>(),
          getIt<IFirestoreRepository>(),
        )..add(AppStarted()),
      ),
      BlocProvider(create: (context) => WordListBloc()..add(GetAllWords())),
    ];
  }

  static final route = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: '/nav',
        builder: (context, state) => const NavView(),
      ),
      GoRoute(
        path: '/stories',
        builder: (context, state) => StoriesView(level: state.uri.queryParameters['level'] ?? "a1"),
      ),
      GoRoute(
        path: '/read',
        builder: (context, state) => StoryReadView(),
      ),
      GoRoute(
        path: '/intro',
        builder: (context, state) => StoryIntroductionView(),
      ),
      GoRoute(
        path: '/wordList',
        builder: (context, state) => WordListView(words: state.extra as List<String>),
      ),
      GoRoute(
        path: '/wordDetail',
        builder: (context, state) => WordDetailView(dictionary: state.extra as Dictionary),
      ),
    ],
  );
}
