import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/navigation/bloc/nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.navbarItem.pageIndex,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _icon("home"),
              label: 'home.title'.tr(context: context),
            ),
            BottomNavigationBarItem(
              icon: _icon("stories"),
              label: 'storyLevel.title'.tr(context: context),
            ),
            BottomNavigationBarItem(
              icon: _icon("user"),
              label: 'profile.title'.tr(context: context),
            ),
            BottomNavigationBarItem(
              icon: _icon("settings"),
              label: 'settings.title'.tr(context: context),
            ),
          ],
          onTap: (index) {
            context.read<NavBloc>().add(ChangeView(index: index));
          },
        );
      },
    );
  }

  ImageIcon _icon(String fileName) => ImageIcon(AssetImage('assets/image/icon/$fileName.png'));
}
