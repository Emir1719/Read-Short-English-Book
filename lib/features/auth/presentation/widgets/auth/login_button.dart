import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
          return;
        }
        context.read<AuthBloc>().add(
              SignInRequested(email.text, password.text),
            );
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return Text(
              "auth.login",
              style: context.text.bodyMedium?.copyWith(
                color: context.color.onPrimary,
              ),
            ).tr();
          } else if (state is AuthLoading) {
            return const AppLoading();
          } else {
            return const AppError(message: "No user information available");
          }
        },
      ),
    );
  }
}
