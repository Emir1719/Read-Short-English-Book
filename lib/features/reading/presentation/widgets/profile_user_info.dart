import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticationAuthenticated).user;

    return Padding(
      padding: AppPadding.defaults,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "User Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text("Email:"),
            subtitle: Text(user.email),
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            title: const Text("ID:"),
            subtitle: Text(user.id),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
