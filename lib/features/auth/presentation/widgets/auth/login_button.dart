import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
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
      child: const Text("Login"),
    );
  }
}
