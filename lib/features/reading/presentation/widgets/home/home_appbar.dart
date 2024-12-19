import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/home_filter_category_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/home_search_button.dart';
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
              decoration: InputDecoration(
                hintText: "home.search".tr(),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              autofocus: true,
              onChanged: (query) {
                context.read<ReadingBloc>().add(SearchStories(query)); // Arama işlemini tetikleme
              },
            );
          }
          return const Text("home.title").tr();
        },
      ),
      actions: [
        HomeSearchButton(),
        HomeFilterCategoryButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
