import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/signup_button.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController age = TextEditingController();
    final TextEditingController password = TextEditingController();
    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: ListView(
        padding: AppPadding.defaults,
        children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
          ),
          space,
          TextField(
            controller: password,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          space,
          TextField(
            controller: age,
            decoration: const InputDecoration(labelText: "Age"),
            keyboardType: TextInputType.number,
          ),
          space,
          SignUpButton(email: email, password: password, age: age),
          const AuthErrorListener(),
        ],
      ),
    );
  }
}
