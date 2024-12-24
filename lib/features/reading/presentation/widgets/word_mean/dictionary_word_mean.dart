import 'package:english_will_fly/core/auth_dependency.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';
import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_bottom_section.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryWordMean extends StatelessWidget {
  const DictionaryWordMean({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryBloc, DictionaryState>(
      bloc: DictionaryBloc(getIt<IDictionaryRepository>())..add(GetMean(word: word)),
      builder: (context, state) {
        if (state is DictionaryLoading) {
          return const AppLoading();
        } else if (state is DictionaryError) {
          return AppError(message: state.message);
        } else if (state is DictionaryLoaded) {
          return BottomSheetBottomSection(state: state, word: word);
        } else if (state is DictionaryInitial) {
          return const SizedBox.shrink();
        }
        return const Text("...");
      },
    );
  }
}
