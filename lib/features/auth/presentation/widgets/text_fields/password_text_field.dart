import 'package:english_will_fly/features/auth/presentation/bloc/password/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, bool>(
        builder: (context, isObscured) {
          return TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () => context.read<PasswordCubit>().togglePasswordVisibility(),
                icon: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            obscureText: isObscured,
          );
        },
      ),
    );
  }
}
