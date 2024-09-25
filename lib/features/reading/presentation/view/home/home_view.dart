import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/stories_list.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: BlocBuilder<ReadingBloc, ReadingState>(
        bloc: ReadingBloc()..add(LoadAllStories()),
        builder: (context, state) {
          if (state is ReadingLoading) {
            return const AppLoading();
          } else if (state is ReadingLoaded) {
            return HomeStoriesList(state: state);
          } else if (state is ReadingError) {
            return AppError(message: state.message);
          }
          return Container();
        },
      ),
    );
  }
}
