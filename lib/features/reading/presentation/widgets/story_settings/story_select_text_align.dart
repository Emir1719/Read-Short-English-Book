import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StorySelectTextAlign extends StatelessWidget {
  const StorySelectTextAlign({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StorySettingsBloc>();

    return BlocBuilder<StorySettingsBloc, StorySettingsState>(
      builder: (context, state) {
        if (state is StorySettingsLoading) {
          return AppLoading();
        } else if (state is StorySettingsError) {
          return AppError(message: state.message);
        }

        final stateLoad = state as StorySettingsLoaded;
        final selectedAlign = stateLoad.textAlign;

        // Yardımcı fonksiyon: Belirtilen ikon ve textAlign değeri için buton oluşturur.
        Widget buildTextAlignButton({
          required IconData icon,
          required TextAlign align,
          required bool isSelected,
        }) {
          return InkWell(
            onTap: () {
              // Eğer seçili değilse, yeni stil oluşturup bloc'a gönder.
              bloc.add(ChangeAlign(align));
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                // Seçili buton için arka plan rengini vurguluyoruz.
                color: isSelected ? context.color.secondary : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                icon,
                // Seçili ise ikon rengini beyaz yap, değilse siyah.
                color: isSelected ? Colors.white : context.color.onSurface,
              ),
            ),
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sol hizalama butonu:
                buildTextAlignButton(
                  icon: Icons.format_align_left,
                  align: TextAlign.left,
                  isSelected: selectedAlign == TextAlign.left,
                ),
                // Ortala hizalama butonu:
                buildTextAlignButton(
                  icon: Icons.format_align_center,
                  align: TextAlign.center,
                  isSelected: selectedAlign == TextAlign.center,
                ),
                // Sağ hizalama butonu:
                buildTextAlignButton(
                  icon: Icons.format_align_right,
                  align: TextAlign.right,
                  isSelected: selectedAlign == TextAlign.right,
                ),
                // İki yana yasla (justify) hizalama butonu:
                buildTextAlignButton(
                  icon: Icons.format_align_justify,
                  align: TextAlign.justify,
                  isSelected: selectedAlign == TextAlign.justify,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
