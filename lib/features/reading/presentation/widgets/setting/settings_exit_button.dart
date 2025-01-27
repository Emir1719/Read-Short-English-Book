import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_exit_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsExitButton extends StatelessWidget {
  const SettingsExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AuthBloc>().add(SignOutRequested()),
      child: SettingsContainerBase(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('settings.exit').tr(context: context),
            ExitButton(),
          ],
        ),
      ),
    );
  }
}
