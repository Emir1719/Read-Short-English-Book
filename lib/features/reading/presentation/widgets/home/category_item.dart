import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ReadingBloc>().state as ReadingLoaded;
    bool isSelected = bloc.selectedCategoryId == category.id;

    return GestureDetector(
      onTap: () {
        context.read<ReadingBloc>().add(FilterStoriesByCategory(category.id));
      },
      child: Container(
        padding: AppPadding.categoryIn,
        decoration: BoxDecoration(
          border: Border.all(color: context.color.surfaceContainerLow),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 15,
          children: [
            ImageIcon(
              AssetImage("assets/image/category_icon/${category.iconName}"),
              size: 20,
              color: isSelected ? context.color.secondary : context.color.onSurface,
            ),
            Expanded(
              child: Text(
                category.title,
                style: context.text.bodyMedium?.copyWith(color: context.color.onSurface),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
