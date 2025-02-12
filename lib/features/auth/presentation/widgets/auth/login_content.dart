import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/forgot_password_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/go_signup_view_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/login_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/text_fields/email_text_field.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/text_fields/password_text_field.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    const space = SizedBox(height: 20);

    return Center(
      child: ListView(
        padding: AppPadding.defaults,
        shrinkWrap: true,
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
          LoginButton(email: email, password: password),
          space,
          const ForgotPasswordButton(),
          space,
          const GoSignUpButton(),
          const AuthErrorListener(),
        ],
      ),
    );
  }
}
