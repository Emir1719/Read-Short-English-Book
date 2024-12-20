import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Container(
      decoration: AppStyle.settings(isDark),
      child: DropdownButton<Locale>(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        value: EasyLocalization.of(context)?.locale, // Mevcut locale ayarını seçili olarak göster
        onChanged: (Locale? locale) {
          if (locale != null) {
            EasyLocalization.of(context)?.setLocale(locale); // Yeni locale ayarını güncelle
          }
        },
        underline: SizedBox(),
        dropdownColor: isDark ? AppColor.scaffoldBackgroundDark : AppColor.white,
        isExpanded: true,
        menuWidth: context.width(0.8),
        borderRadius: BorderRadius.circular(10),
        style: textTheme.bodyMedium,
        iconEnabledColor: isDark ? AppColor.white : AppColor.black,
        items: [
          DropdownMenuItem(
            value: Locale('en', ''),
            child: Text('English'),
          ),
          DropdownMenuItem(
            value: Locale('tr', ''),
            child: Text('Türkçe'),
          ),
        ],
      ),
    );
  }
}
