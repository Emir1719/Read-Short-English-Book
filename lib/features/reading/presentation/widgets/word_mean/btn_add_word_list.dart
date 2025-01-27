import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
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
            label: _label(context, state),
            icon: _icon(context),
          );
        },
      ),
    );
  }

  Icon _icon(BuildContext context) {
    return !_isAdded(context)
        ? Icon(Icons.add_circle_outline, color: context.color.tertiary)
        : Icon(Icons.remove_circle_outline, color: Colors.red);
  }

  void _listener(context, state) {
    if (state is WordListLoaded) {
      /*ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('word_list.message').tr()),
      );*/
    }
  }

  Widget _label(BuildContext context, WordListState state) {
    if (state is WordListLoading) {
      return CircularProgressIndicator();
    } else if (state is WordListLoaded) {
      return !_isAdded(context)
          ? Text(
              "word_list.add",
              style: TextStyle(color: context.color.tertiary),
            ).tr()
          : Text(
              "word_list.remove",
              style: TextStyle(color: context.color.error),
            ).tr();
    }
    return SizedBox();
  }

  bool _isAdded(BuildContext context) {
    var list = context.read<WordListBloc>().wordList?.words ?? [];
    return list.contains(word);
  }

  /// Butonun `onPressed` metodunu belirler.
  VoidCallback? _action(BuildContext context, WordListState state) {
    if (state is WordListLoaded) {
      final bloc = context.read<WordListBloc>();

      return _isAdded(context)
          ? () => bloc.add(RemoveWord(word: word))
          : () => bloc.add(SaveWord(word: word));
    }
    return null;
  }
}
