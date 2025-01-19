import 'package:flutter/material.dart';

extension FutureBuilderExtensions<T> on Future<T> {
  FutureBuilder<T> builder({
    required Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) onSuccess,
    Widget Function(BuildContext context)? onEmptyData,
    Widget Function(BuildContext context)? onLoading,
  }) {
    return FutureBuilder<T>(
      future: this,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return onEmptyData != null ? onEmptyData(context) : const SizedBox();
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return onLoading != null
                ? onLoading(context)
                : const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            return onSuccess(context, snapshot);
          case ConnectionState.none:
            return onEmptyData != null ? onEmptyData(context) : const SizedBox();
          default:
            return const SizedBox();
        }
      },
    );
  }
}
