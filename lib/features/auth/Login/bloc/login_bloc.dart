import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:cosmo_futsal/core/common/error_model/error_model.dart';
import 'package:cosmo_futsal/features/auth/Login/services/login_services.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final loginService = GetIt.instance.get<TestLoginService>();
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitialEvent) {
        emit(LoginInitial());
      } else if (event is UserLoginEvent) {
        emit(LoginLoadingState());
        var result = await loginService.userLogin(formData: event.formData);
        result.fold((l) {
          emit(UserLoginSuccessState(response: l));
        }, (r) {
          emit(UserLoginErrorState(
              errorModel: ErrorModel(
                code: r.code,
                message: r.message ?? "Unknown Error",
              )));
        });
      }
    });
  }
}