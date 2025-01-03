import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/go_signup_view_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/login_button.dart';
import 'package:english_will_fly/features/reading/util/image.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    const space = SizedBox(height: 20);

    return ListView(
      padding: AppPadding.defaults,
      children: [
        space,
        Image.asset(AppImage.account, height: 150),
        space,
        space,
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
        LoginButton(email: email, password: password),
        space,
        const GoSignUpButton(),
        const AuthErrorListener(),
      ],
    );
  }
}
