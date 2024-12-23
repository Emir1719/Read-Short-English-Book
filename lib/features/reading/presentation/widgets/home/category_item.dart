import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReadingBloc>().state as ReadingLoaded;
    bool isSelected = bloc.selectedCategoryId == category.id;
    Color? color = context.isDark ? AppStyle.darkMode(isSelected) : AppStyle.lightMode(isSelected);

    return GestureDetector(
      onTap: () {
        context.read<ReadingBloc>().add(FilterStoriesByCategory(category.id));
      },
      child: Container(
        padding: AppPadding.categoryIn,
        decoration: AppStyle.categoryBox(context.isDark, isSelected),
        child: Row(
          children: [
            ImageIcon(
              AssetImage("assets/image/category_icon/${category.iconName}"),
              size: 20,
              color: color,
            ),
            SizedBox(width: 15),
            Text(
              category.title,
              style: context.text.bodyMedium?.copyWith(color: color),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
