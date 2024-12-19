import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchButton extends StatelessWidget {
  const HomeSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(state is ReadingLoaded && state.isSearchActive ? Icons.close : Icons.search),
          onPressed: () {
            context.read<ReadingBloc>().add(ToggleSearchBar()); // Arama barını aç/kapa
          },
        );
      },
    );
  }
}
