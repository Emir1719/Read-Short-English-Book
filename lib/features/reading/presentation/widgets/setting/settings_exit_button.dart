import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/constants/app_dialog.dart';
import 'package:english_will_fly/core/extensions/string_extensions.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:english_will_fly/features/reading/util/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsExitButton extends StatelessWidget {
  const SettingsExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AppDialog.show(
          context: context,
          title: "Çıkış",
          content: "Çıkış Yapmak İstediğine Emin misin?",
          onSuccess: () {
            context.read<AuthBloc>().add(SignOutRequested());
          },
        );
      },
      child: SettingsContainerBase(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('settings.exit').tr(context: context),
              AppImage.exit.toIcon(context),
            ],
          ),
        ),
      ),
    );
  }
}
