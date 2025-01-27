import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/constants/suported_locales.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final analytics = FirebaseAnalytics.instance;

    return SettingsContainerBase(
      child: DropdownButton<Locale>(
        value: EasyLocalization.of(context)?.locale, // Mevcut locale ayarını seçili olarak göster
        onChanged: (Locale? locale) async {
          if (locale != null) {
            EasyLocalization.of(context)?.setLocale(locale); // Yeni locale ayarını güncelle
            await analytics.logEvent(name: "language_selected_${locale.languageCode}");
          }
        },
        isExpanded: true,
        underline: SizedBox(),
        dropdownColor: context.color.surface,
        menuWidth: context.width(0.9),
        borderRadius: BorderRadius.circular(10),
        style: textTheme.bodyMedium,
        iconEnabledColor: context.color.onSurface,
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
              fit: BoxFit.fitWidth,
            ),
            Text(SupportedLocales.localeNames[locale]!),
          ],
        ),
      );
    }).toList();
  }
}
