import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/signup_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/text_fields/email_text_field.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/text_fields/password_text_field.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("auth.register").tr()),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: AppPadding.defaults,
          children: [
            Padding(
              padding: AppPadding.signForButton,
              child: Column(
                spacing: 20,
                children: [
                  EmailTextField(controller: email),
                  PasswordTextField(controller: password),
                ],
              ),
            ),
            SignUpButton(email: email, password: password),
            const AuthErrorListener(),
          ],
        ),
      ),
    );
  }
}
