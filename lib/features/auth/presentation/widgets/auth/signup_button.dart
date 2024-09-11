import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthenticationBloc>().add(
              SignUpRequested(email.text, password.text),
            );
      },
      child: const Text("Sign Up"),
    );
  }
}
