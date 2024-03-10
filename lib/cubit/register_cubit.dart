import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/register.dart';
import 'package:wallet_app/cubit/register_state.dart';
import 'package:wallet_app/data/model/end_point.dart';
import 'package:wallet_app/data/model/login_model.dart';
import 'package:wallet_app/data/model/register_model.dart';
import 'package:wallet_app/data/remote/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  RegisterModel ? registerModel;


  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
required String cPassword,
    required String dueDate,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
        //url: REGISTER,
        url: REGISTER,
        data: {
          'firstName':firstName,
          'lastName':lastName,
          'email':email,
          'password':password,
          'cPassword':cPassword,
          'dueDate':dueDate,
        }
    ).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel:registerModel!));
    }
    ).catchError((error){
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangeVisibilityState());
  }
}
