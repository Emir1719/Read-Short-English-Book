import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/firestore.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticationAuthenticated).user;
    final repo = FirestoreRepository(FirebaseFirestore.instance, FirebaseAuth.instance);

    return Padding(
      padding: AppPadding.defaults,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text("Email:"),
            subtitle: Text(user.email),
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            title: const Text("Age:"),
            subtitle: Text(user.age),
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            title: const Text("Total Reading:"),
            subtitle: FutureBuilder(
              future: repo.getReading(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data?.storyIds.length.toString() ?? "0");
                }
                return const SizedBox();
              },
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
