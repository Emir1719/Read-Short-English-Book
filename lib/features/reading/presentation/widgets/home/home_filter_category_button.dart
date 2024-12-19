import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/categories.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFilterCategoryButton extends StatelessWidget {
  const HomeFilterCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        return state is ReadingLoaded && !state.isSearchActive
            ? IconButton(
                icon: Icon(Icons.filter_alt_outlined),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    ),
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: AppPadding.defaults,
                        decoration: AppStyle.dictionary(isDark),
                        child: Categories(),
                      );
                    },
                  );
                },
              )
            : SizedBox();
      },
    );
  }
}
