import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _listener,
      child: const Scaffold(body: AppLoading()),
    );
  }

  void _listener(BuildContext context, state) {
    if (state is Authenticated) {
      // uygulama dark temada başlayınca hikaye metni siyah kalmasın diye eklendi
      context.read<StorySettingsBloc>().add(RefreshSettings(
            context.color.primary == Colors.white ? Colors.black : Colors.white,
          ));

      context.pushReplacement("/nav");
    } else if (state is Unauthenticated) {
      context.pushReplacement("/login");
    }
  }
}
