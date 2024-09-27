import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<ReadingBloc, ReadingState>(
        builder: (context, state) {
          if (state is ReadingLoaded && state.isSearchActive) {
            return TextField(
              decoration: const InputDecoration(
                hintText: "Search stories...",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              autofocus: true,
              onChanged: (query) {
                context.read<ReadingBloc>().add(SearchStories(query)); // Arama işlemini tetikleme
              },
            );
          }
          return const Text("Home");
        },
      ),
      actions: [
        BlocBuilder<ReadingBloc, ReadingState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(state is ReadingLoaded && state.isSearchActive ? Icons.close : Icons.search),
              onPressed: () {
                context.read<ReadingBloc>().add(ToggleSearchBar()); // Arama barını aç/kapa
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
