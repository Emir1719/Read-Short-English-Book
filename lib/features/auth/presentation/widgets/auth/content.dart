import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/login_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/signup_button.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    const space = SizedBox(height: 20);

    return Padding(
      padding: AppPadding.defaults,
      child: ListView(
        children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          space,
          TextField(
            controller: password,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          space,
          LoginButton(email: email, password: password),
          space,
          SignUpButton(email: email, password: password),
          const AuthErrorListener(),
        ],
      ),
    );
  }
}
