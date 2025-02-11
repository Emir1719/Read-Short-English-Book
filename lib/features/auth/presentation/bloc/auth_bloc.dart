import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_user.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final IFirestoreUser _firestoreRepository;
  final _analytics = FirebaseAnalytics.instance;

  AuthBloc(this._authRepository, this._firestoreRepository) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<EmailVerify>(_onEmailVerify);
    on<ForgotPassword>(_onForgotPassword);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.getCurrentUser();
      if (user == null) {
        emit(Unauthenticated());
        return;
      }
      final appUser = await _firestoreRepository.getCurrentUser(user.uid);

      if (appUser == null) {
        emit(const AuthFailure("Kullanıcı yok"));
        return;
      }
      emit(Authenticated(appUser));
    } catch (_) {
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignUpRequested(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signUp(event.email, event.password);
      final appUser = AppUser.fromFirebaseUser(user!);
      await _firestoreRepository.saveUser(user);
      emit(Authenticated(appUser));

      await _analytics.logEvent(name: "sign_up");
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignInRequested(SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signIn(event.email, event.password);
      if (user == null) {
        emit(const AuthFailure("Kullanıcı yok"));
        return;
      }
      final appUser = await _firestoreRepository.getCurrentUser(user.uid);

      if (appUser == null) {
        emit(const AuthFailure("Kullanıcı yok"));
        return;
      }

      emit(Authenticated(appUser));

      await _analytics.logEvent(name: "sign_in");
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(SignOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await _authRepository.signOut();
      emit(Unauthenticated());
    } on Exception catch (e) {
      emit(AuthFailure(e.toString()));
    }

    await _analytics.logEvent(name: "sign_out");
  }

  Future<void> _onEmailVerify(EmailVerify event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.sendEmailVerification();
    } on Exception catch (e) {
      emit(AuthFailure(e.toString()));
    }

    await _analytics.logEvent(name: "email_verify");
  }

  Future<void> _onForgotPassword(ForgotPassword event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.forgotPassword(event.email, event.langCode);
    } on Exception catch (e) {
      emit(AuthFailure(e.toString()));
    }

    await _analytics.logEvent(name: "forgot_password");
  }
}
