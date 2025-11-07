import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/user_entity.dart';
import '../domain/usecases/login_usecase.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;

  AuthCubit({required this.loginUseCase}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase.call(email, password);
      if (user != null)
        emit(AuthSuccess(user));
      else
        emit(AuthFailure('Email hoặc mật khẩu không đúng'));
    } catch (e) {
      emit(AuthFailure(''));
    }
  }
}
