import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/signup_button.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text("auth.register").tr()),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: AppPadding.defaults,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            space,
            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            space,
            space,
            space,
            SignUpButton(email: email, password: password),
            const AuthErrorListener(),
          ],
        ),
      ),
    );
  }
}
