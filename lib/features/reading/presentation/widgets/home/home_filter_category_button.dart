import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/bottom_sheet_base.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/home/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFilterCategoryButton extends StatelessWidget {
  const HomeFilterCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        return state is ReadingLoaded && !state.isSearchActive
            ? IconButton(
                icon: Icon(Icons.filter_alt_outlined),
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheetBase(child: Categories());
                    },
                  );
                },
              )
            : SizedBox();
      },
    );
  }
}
