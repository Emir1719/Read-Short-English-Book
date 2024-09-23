import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/content.dart';
import 'package:english_will_fly/features/reading/presentation/view/level_home/level_home_view.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _listener,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUnauthenticated) {
              return const LoginContent();
            } else if (state is AuthenticationLoading) {
              return const AppLoading();
            } else {
              return const AppError(message: "No user information available");
            }
          },
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is AuthenticationAuthenticated) {
      // Kayıt ya da giriş başarılıysa ana sayfaya yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StoryLevelHomeView()),
      );
    } else if (state is AuthenticationFailure) {
      // Hata mesajı göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication Failure: ${state.error}')),
      );
    }
  }
}
