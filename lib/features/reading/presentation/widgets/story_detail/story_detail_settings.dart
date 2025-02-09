import 'package:english_will_fly/features/reading/presentation/widgets/bottom_sheet_base.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/story_settings_page.dart';
import 'package:flutter/material.dart';

class StoryDetailSettings extends StatelessWidget {
  const StoryDetailSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return StoryDetailItem(
      icon: Icons.settings,
      tooltip: "Ayarlar",
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheetBase(child: StorySettingsPage());
          },
        );
      },
    );
  }
}
