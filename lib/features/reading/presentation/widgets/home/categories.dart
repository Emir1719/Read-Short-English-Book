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
          return SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
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
                    margin: AppPadding.categoryInMargin,
                    decoration: AppStyle.categoryBox(isDark, isSelected),
                    child: Center(
                      child: Text(
                        category.title,
                        style: textTheme.bodyMedium?.copyWith(
                          color: isDark
                              ? AppStyle.darkMode(isSelected)
                              : AppStyle.lightMode(isSelected),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return SizedBox();
      },
    );
  }
}
