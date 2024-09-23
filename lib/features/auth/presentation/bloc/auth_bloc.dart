import 'package:english_will_fly/features/auth/data/models/user.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_auth_repository.dart';
import 'package:english_will_fly/features/auth/data/repositories/i_firestore_repository.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_event.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authRepository;
  final IFirestoreRepository _firestoreRepository;

  AuthenticationBloc(this._authRepository, this._firestoreRepository) : super(AuthenticationInitial()) {
    on<AppStarted>(_onAppStarted);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authRepository.getCurrentUser();
      if (user == null) {
        emit(const AuthenticationFailure("Kullanıcı yok"));
        return;
      }
      final appUser = await _firestoreRepository.getCurrentUser(user.uid);

      if (appUser == null) {
        emit(const AuthenticationFailure("Kullanıcı yok"));
        return;
      }
      emit(AuthenticationAuthenticated(appUser));
    } catch (_) {
      emit(AuthenticationUnauthenticated());
    }
  }

  Future<void> _onSignUpRequested(SignUpRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authRepository.signUp(event.email, event.password);
      final appUser = AppUser.fromFirebaseUser(user!);
      await _firestoreRepository.saveUser(user, event.age);
      appUser.age = event.age;
      emit(AuthenticationAuthenticated(appUser));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  Future<void> _onSignInRequested(SignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final user = await _authRepository.signIn(event.email, event.password);
      if (user == null) {
        emit(const AuthenticationFailure("Kullanıcı yok"));
        return;
      }
      final appUser = await _firestoreRepository.getCurrentUser(user.uid);

      if (appUser == null) {
        emit(const AuthenticationFailure("Kullanıcı yok"));
        return;
      }

      emit(AuthenticationAuthenticated(appUser));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(SignOutRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await _authRepository.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
