import 'package:english_will_fly/features/reading/presentation/widgets/home/home_appbar_title.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/home_filter_category_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/home_search_button.dart';
import 'package:flutter/material.dart';

class HomeSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: HomeAppbarTitle(),
      actions: [
        HomeSearchButton(),
        HomeFilterCategoryButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
