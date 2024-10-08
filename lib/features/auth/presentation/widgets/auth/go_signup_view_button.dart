import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoSignUpButton extends StatelessWidget {
  const GoSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push("/signUp"),
      child: const Text("Go to Sign Up"),
    );
  }
}
