import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BtnAddWordList extends StatelessWidget {
  const BtnAddWordList({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WordListBloc, WordListState>(
      listener: _listener,
      child: BlocBuilder<WordListBloc, WordListState>(
        builder: (context, state) {
          return TextButton.icon(
            onPressed: _action(context, state),
            label: _label(state),
            icon: Icon(Icons.add),
          );
        },
      ),
    );
  }

  void _listener(context, state) {
    if (state is WordListLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('word_list.message').tr()),
      );
    }
  }

  Widget _label(WordListState state) =>
      state is WordListLoading ? CircularProgressIndicator() : Text("word_list.add").tr();

  /// Butonun `onPressed` metodunu belirler.
  VoidCallback? _action(BuildContext context, WordListState state) {
    if (state is WordListLoading) {
      return null; // Butonu devre dışı bırak
    } else {
      return () => context.read<WordListBloc>().add(SaveWord(word: word));
    }
  }
}
