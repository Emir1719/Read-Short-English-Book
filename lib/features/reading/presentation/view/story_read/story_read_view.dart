import 'package:english_will_fly/features/reading/presentation/widgets/story_detail/story_chapters_drawer.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_detail/story_read_appbar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_page_builder.dart';
import 'package:flutter/material.dart';

class StoryReadView extends StatelessWidget {
  const StoryReadView({super.key});

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: StoryReadAppbar(),
      drawer: StoryChaptersDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            StoryReadPageBuilder(), // Chapter için
            StoryDetail(scaffoldKey: _scaffoldKey),
          ],
        ),
      ),
    );
  }
}
