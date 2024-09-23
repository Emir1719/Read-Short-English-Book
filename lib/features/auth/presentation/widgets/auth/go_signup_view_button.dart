import 'package:english_will_fly/features/auth/presentation/view/auth/sign_up_view.dart';
import 'package:flutter/material.dart';

class GoSignUpButton extends StatelessWidget {
  const GoSignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpView()),
        );
      },
      child: const Text("Go to Sign Up"),
    );
  }
}
