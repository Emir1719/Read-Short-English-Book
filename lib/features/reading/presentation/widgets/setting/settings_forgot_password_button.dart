import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/constants/app_dialog.dart';
import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsForgotPasswordButton extends StatelessWidget {
  const SettingsForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await AppDialog.show(
          context: context,
          title: "Şifre Sıfırlama",
          content: "Size bir mail gönderilecek. (Spamlar bölümünü de kontrol ediniz)",
          onSuccess: () async {
            final auth = getIt<IAuthRepository>();
            final user = await auth.getCurrentUser();

            if (user == null || user.email == null) {
              return;
            }

            if (!context.mounted) return;

            context
                .read<AuthBloc>()
                .add(ForgotPassword(langCode: context.locale.languageCode, email: user.email!));

            context.pop();
          },
        );
      },
      child: SettingsContainerBase(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Şifremi Unuttum").tr(context: context),
              Icon(Icons.password, color: context.color.onSurface),
            ],
          ),
        ),
      ),
    );
  }
}
