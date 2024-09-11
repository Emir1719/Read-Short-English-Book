import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthenticationBloc>().add(SignOutRequested()),
          ),
        ],
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
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
                    subtitle: Text(state.user.email ?? 'No Email'),
                  ),
                  ListTile(
                    title: const Text("Display Name:"),
                    subtitle: Text(state.user.displayName ?? 'No Display Name'),
                  ),
                  ListTile(
                    title: const Text("User ID:"),
                    subtitle: Text(state.user.uid),
                  ),
                ],
              ),
            );
          } else if (state is AuthenticationLoading) {
            return const AppLoading();
          } else {
            return const AppError(message: "No user information available");
          }
        },
      ),
    );
  }
}
