import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppbarTitle extends StatelessWidget {
  const HomeAppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        if (state is ReadingLoaded && state.isSearchActive) {
          return TextField(
            decoration: InputDecoration(
              hintText: "home.search".tr(),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(
                color: context.isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            cursorColor: context.isDark ? Colors.white : Colors.black,
            autofocus: true,
            onChanged: (query) {
              context.read<ReadingBloc>().add(SearchStories(query)); // Arama işlemini tetikleme
            },
          );
        }
        return const Text("home.title").tr();
      },
    );
  }
}
