import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/constants/app_dialog.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsEmailVerifyButton extends StatelessWidget {
  const SettingsEmailVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AppDialog.show(
          context: context,
          title: "Mail Doğrulayın",
          content: "Size bir mail gönderilecek. (Spamlar bölümünü de kontrol ediniz)",
          onSuccess: () {
            context.read<AuthBloc>().add(EmailVerify());
          },
        );
      },
      child: SettingsContainerBase(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mail Doğrula").tr(context: context),
              Icon(Icons.mail, color: context.color.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}
