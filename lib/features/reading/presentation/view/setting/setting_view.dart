import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/localization/presentation/bloc/easy_localization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title').tr(),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: (Locale locale) {
              context.read<EasyLocalizationBloc>().add(ChangeLocaleEvent(locale));
              EasyLocalization.of(context)?.setLocale(locale); // Burada context kullanarak locale ayarlanıyor
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                PopupMenuItem(
                  value: Locale('tr', ''),
                  child: Text('Türkçe'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Yakında'),
      ),
    );
  }
}
