import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class SignUpRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final String age;

  const SignUpRequested(this.email, this.password, this.age);

  @override
  List<Object?> get props => [email, password];
}

class SignInRequested extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class SignOutRequested extends AuthenticationEvent {}
