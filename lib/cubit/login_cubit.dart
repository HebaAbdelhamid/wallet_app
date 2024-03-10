import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/data/model/end_point.dart';
import 'package:wallet_app/data/model/login_model.dart';
import 'package:wallet_app/data/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      var result = await DioHelper.postData(url: LOGIN, data: {
        'email': email,
        'password': password,
      });
      print(result.data);
      var user = User.fromJson(result.data);
      print(user.data!.email);
      emit(LoginSuccessState(user));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
      print(e.toString());
    }
    ;
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(LoginChangeVisibilityState());
  }
}
