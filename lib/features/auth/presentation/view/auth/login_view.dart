import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/auth/presentation/widgets/auth/content.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("auth.login").tr()),
      body: BlocListener<AuthBloc, AuthState>(
        listener: _listener,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              return const LoginContent();
            } else if (state is AuthLoading) {
              return const AppLoading();
            } else {
              return const AppError(message: "No user information available");
            }
          },
        ),
      ),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is Authenticated) {
      // Kayıt ya da giriş başarılıysa ana sayfaya yönlendir
      context.pushReplacement("/nav");
    } else if (state is AuthFailure) {
      // Hata mesajı göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication Failure: ${state.error}')),
      );
    }
  }
}
