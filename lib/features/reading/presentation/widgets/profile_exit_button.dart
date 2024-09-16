import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileExitButton extends StatelessWidget {
  const ProfileExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return const AppLoading();
        } else {
          return IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthenticationBloc>().add(SignOutRequested());
            },
          );
        }
      },
    );
  }
}
