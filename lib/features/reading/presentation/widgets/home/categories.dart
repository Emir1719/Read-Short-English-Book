import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        if (state is ReadingLoading) {
          return CircularProgressIndicator();
        }

        if (state is ReadingLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 16 / 5,
            ),
            itemCount: state.categories.length,
            padding: AppPadding.categoryOut,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              bool isSelected = state.selectedCategoryId == category.id;
              bool isDark = context.read<ThemeBloc>().state.isDarkMode;

              return GestureDetector(
                onTap: () {
                  context.read<ReadingBloc>().add(FilterStoriesByCategory(category.id));
                },
                child: Container(
                  padding: AppPadding.categoryIn,
                  decoration: AppStyle.categoryBox(isDark, isSelected),
                  child: Center(
                    child: Text(
                      category.title,
                      style: textTheme.bodyMedium?.copyWith(
                        color:
                            isDark ? AppStyle.darkMode(isSelected) : AppStyle.lightMode(isSelected),
                      ),
                    ).tr(),
                  ),
                ),
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }
}
