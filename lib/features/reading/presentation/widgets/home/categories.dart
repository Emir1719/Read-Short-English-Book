import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/category_item.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        if (state is ReadingLoading) {
          return AppLoading();
        }

        if (state is ReadingLoaded) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kategoriler", style: context.text.bodyLarge),
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(Icons.close, color: context.color.secondary),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 16 / 5,
                      ),
                      itemCount: state.categories.length,
                      padding: AppPadding.categoryOut,
                      itemBuilder: (context, index) {
                        return CategoryItem(category: state.categories[index]);
                      },
                    ),
                  ),
                ],
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }
}
