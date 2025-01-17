import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileExitButton extends StatelessWidget {
  const ProfileExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const AppLoading();
        } else if (state is Authenticated) {
          return IconButton(
            icon: ImageIcon(
              AssetImage('assets/image/icon/exit.png'),
              color: context.isDark ? Colors.white : Colors.grey.shade900,
            ),
            onPressed: () {
              context.read<AuthBloc>().add(SignOutRequested());
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
