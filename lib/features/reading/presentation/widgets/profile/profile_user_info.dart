import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/info_box.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticationAuthenticated).user;
    final stories = context.read<ReadingBloc>().stories;
    var completedStories = stories?.where((element) => element.isCompleted);
    const space = SizedBox(height: 20);
    var count = 0;
    completedStories?.forEach((element) {
      count += element.definitions.length;
    });

    return Padding(
      padding: AppPadding.defaults,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoBox(
            title: "Email",
            value: user.email,
            icon: Icons.email,
          ),
          space,
          InfoBox(
            title: "Age",
            value: user.age,
            icon: Icons.align_vertical_bottom_rounded,
          ),
          space,
          InfoBox(
            title: "Total Reading",
            value: (completedStories?.length ?? 0).toString(),
            icon: Icons.add_task_sharp,
          ),
          space,
          InfoBox(
            title: "Total Words",
            value: count.toString(),
            icon: Icons.add_home_rounded,
          ),
        ],
      ),
    );
  }
}
