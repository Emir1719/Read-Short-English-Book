// ignore_for_file: depend_on_referenced_packages

import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/data/dependency/auth_dependency.dart';
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
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/stories/stories_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/story_read/story_read_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/word_detail/word_detail_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/word_list/word_list_view.dart';
import 'package:english_will_fly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
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

    setupDependencies();
  }

  static List<SingleChildWidget> getBlocProviders() {
    return [
      BlocProvider(create: (context) => ReadingBloc()..add(LoadAllStories())),
      BlocProvider(create: (context) => NavBloc()),
      BlocProvider(create: (context) => WordListBloc()..add(GetAllWords())),
      BlocProvider(create: (context) => DictionaryBloc(getIt<IDictionaryRepository>())),
      BlocProvider(
        create: (context) => AuthenticationBloc(
          getIt<IAuthenticationRepository>(),
          getIt<IFirestoreRepository>(),
        )..add(AppStarted()),
      )
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
        builder: (context, state) => StoryReadView(story: state.extra as Story),
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
