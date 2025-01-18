import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';

class StoryDetailItem extends StatelessWidget {
  const StoryDetailItem({super.key, this.tooltip, this.icon, this.onTap});
  final String? tooltip;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.profileInfoBack,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 14),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
