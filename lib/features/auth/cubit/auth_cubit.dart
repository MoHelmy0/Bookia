import 'package:bloc/bloc.dart';
import 'package:booksotre/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    final response =
    await AuthRepo.login(email: email, password: password);

    if (response) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }


  Future<void> register({
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    emit(AuthLoadingState());
    final response =
    await AuthRepo.register(email: email, password: password ,password_confirmation: password_confirmation);

    if (response) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }
}

