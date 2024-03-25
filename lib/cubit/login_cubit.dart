import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/data/model/end_point.dart';
import 'package:wallet_app/data/model/login_model.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';
import 'package:wallet_app/data/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  // void login({
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(LoginLoadingState());
  //   try {
  //     var result = await DioHelper.postData(url: LOGIN, data: {
  //       'email': email,
  //       'password': password,
  //     });
  //     log(result.data.toString(), name: 'LoginCubit');
  //
  //     var user = User.fromJson(result.data);
  //     print(user);
  //     CacheHelper.saveData(key: 'tokenn', value: user.token);
  //     print('string caches');
  //     if (user.data!.password== password && user.data!.email==email) {
  //       print('finally');
  //       emit(LoginSuccessState(user));
  //     } else {
  //       emit(LoginErrorState('invalid crediential'));
  //     }
  //   } catch (e) {
  //     emit(LoginErrorState(e.toString()));
  //     print(e.toString());
  //   }
  //   ;
  // }
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
      log(result.data.toString(), name: 'LoginCubit');

      var user = User.fromJson(result.data);
      print('Parsed User: $user');
         CacheHelper.saveData(key: 'tokenn', value: user.token);
         CacheHelper.saveData(key: 'id', value: user.data!.id);

      // Check if user data is null
      if (user.data != null) {

var c1=CacheHelper.getData(key: 'email');
var c2=CacheHelper.getData(key: 'password');
emit(LoginSuccessState(user));
        // Check if password and email match
        if ( c2== password && c1 == email) {
          print('Credentials matched');
          emit(LoginSuccessState(user));
        } else {
          print('Credentials did not match');
          emit(LoginErrorState('Invalid credentials'));
        }
      } else {
        print('User data is null');
        emit(LoginErrorState('Invalid user data'));
      }
    } catch (e) {
      print('Error: $e');
      emit(LoginErrorState(e.toString()));
    }
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
