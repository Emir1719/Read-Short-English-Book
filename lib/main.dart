import 'package:english_will_fly/features/reading/presentation/bloc/dictionary/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/home/home_view.dart';
import 'package:english_will_fly/features/reading/util/theme.dart';
import 'package:english_will_fly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReadingBloc()),
        BlocProvider(create: (context) => DictionaryBloc()..add(FetchDictionary())),
      ],
      child: MaterialApp(
        title: "English Will Fly",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const HomeView(),
      ),
    );
  }
}
