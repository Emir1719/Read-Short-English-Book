import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.email, required this.password, required this.age});
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController age;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (email.text.trim().isEmpty || password.text.trim().isEmpty || age.text.trim().isEmpty) {
          return;
        }
        context.read<AuthBloc>().add(
              SignUpRequested(email.text, password.text, age.text),
            );
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return Text("auth.register").tr();
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
