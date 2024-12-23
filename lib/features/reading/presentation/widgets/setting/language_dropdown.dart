import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/constants/suported_locales.dart';
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
        isExpanded: true,
        underline: SizedBox(),
        dropdownColor: isDark ? AppColor.scaffoldBackgroundDark : AppColor.white,
        menuWidth: context.width(0.9),
        borderRadius: BorderRadius.circular(10),
        style: textTheme.bodyMedium,
        iconEnabledColor: isDark ? AppColor.white : AppColor.black,
        items: getDropdownMenuItems(),
      ),
    );
  }

  List<DropdownMenuItem<Locale>> getDropdownMenuItems() {
    return SupportedLocales.locales.map((locale) {
      return DropdownMenuItem(
        value: locale,
        child: Row(
          spacing: 15,
          children: [
            Image.asset(
              'assets/image/language/${locale.languageCode}.png',
              width: 30,
              height: 30,
            ),
            Text(SupportedLocales.localeNames[locale]!),
          ],
        ),
      );
    }).toList();
  }
}
