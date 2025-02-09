import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StorySelectFont extends StatelessWidget {
  const StorySelectFont({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StorySettingsBloc>(context);
    final List<String> availableFonts = [
      'Open Sans',
      'Roboto',
      'Lato',
      'Poppins',
      'Montserrat',
      'Merriweather',
      "Urbanist"
    ];

    return BlocBuilder<StorySettingsBloc, StorySettingsState>(
      builder: (context, state) {
        if (state is StorySettingsLoading) {
          return AppLoading();
        } else if (state is StorySettingsError) {
          return AppError(message: state.message);
        }

        final stateLoad = state as StorySettingsLoaded;

        return SettingsContainerBase(
          child: DropdownButton<String>(
            isExpanded: true,
            value: availableFonts.firstWhere(
              (font) {
                final fontFamily =
                    stateLoad.style.fontFamily?.split("_")[0] ?? availableFonts.first;
                return fontFamily == font;
              },
              orElse: () => 'Urbanist',
            ),
            underline: SizedBox(),
            iconEnabledColor: context.color.onSurface,
            onChanged: (String? newFont) {
              if (newFont != null) {
                // Font seçildiğinde, yeni stil oluşturulup Bloc'a gönderilir
                TextStyle newStyle = GoogleFonts.getFont(
                  newFont,
                  fontSize: stateLoad.style.fontSize,
                  color: context.color.onSurface,
                );
                bloc.add(ChangeStyle(newStyle));
              }
            },
            items: availableFonts.map<DropdownMenuItem<String>>((String font) {
              return DropdownMenuItem<String>(
                value: font,
                child: Text(
                  font,
                  style: GoogleFonts.getFont(font),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
