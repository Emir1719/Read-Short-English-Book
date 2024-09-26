import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  const InfoIcon({super.key, this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.profileInfoBack,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Icon(icon, color: AppColor.profileInfoFront, size: 20),
    );
  }
}
