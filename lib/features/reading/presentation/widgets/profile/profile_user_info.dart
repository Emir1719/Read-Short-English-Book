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
    var count = stories?.where((element) => element.isCompleted).length ?? 0;
    const space = SizedBox(height: 20);

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
            value: count.toString(),
            icon: Icons.add_task_sharp,
          ),
        ],
      ),
    );
  }
}
