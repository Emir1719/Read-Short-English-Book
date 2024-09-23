import 'package:english_will_fly/features/navigation/bloc/nav_bloc.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: AppColor.primary,
          selectedItemColor: AppColor.black,
          currentIndex: state.navbarItem.pageIndex,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode_rounded),
              label: 'Stories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            context.read<NavBloc>().add(ChangeView(index: index));
          },
        );
      },
    );
  }
}
