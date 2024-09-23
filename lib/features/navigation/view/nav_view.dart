import 'package:english_will_fly/features/navigation/bloc/nav_bloc.dart';
import 'package:english_will_fly/features/navigation/widget/bottom_bar.dart';
import 'package:english_will_fly/features/reading/presentation/view/home/home_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/level_home/level_home_view.dart';
import 'package:english_will_fly/features/reading/presentation/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavView extends StatelessWidget {
  const NavView({super.key});

  @override
  Widget build(BuildContext context) {
    const List views = [HomeView(), StoryLevelHomeView(), ProfileView()];

    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      body: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return views[state.navbarItem.pageIndex];
        },
      ),
    );
  }
}
