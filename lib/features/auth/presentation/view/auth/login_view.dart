import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/error_listener.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/login_button.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/signup_button.dart';
import 'package:english_will_fly/features/reading/presentation/view/home/home_view.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    const space = SizedBox(height: 20);

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _listener,
        child: Padding(
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
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is AuthenticationAuthenticated) {
      // Kayıt ya da giriş başarılıysa ana sayfaya yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else if (state is AuthenticationFailure) {
      // Hata mesajı göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication Failure: ${state.error}')),
      );
    }
  }
}
