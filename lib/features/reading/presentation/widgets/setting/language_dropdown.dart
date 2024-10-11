import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return DropdownButton<Locale>(
      value: EasyLocalization.of(context)?.locale, // Mevcut locale ayarını seçili olarak göster
      onChanged: (Locale? locale) {
        if (locale != null) {
          EasyLocalization.of(context)?.setLocale(locale); // Yeni locale ayarını güncelle
        }
      },
      underline: SizedBox(),
      dropdownColor: isDark ? AppColor.scaffoldBackgroundDark : AppColor.white,
      isExpanded: true,
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
    );
  }
}
