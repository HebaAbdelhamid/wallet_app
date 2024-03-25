import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/register.dart';
import 'package:wallet_app/cubit/register_state.dart';
import 'package:wallet_app/data/model/end_point.dart';
import 'package:wallet_app/data/model/login_model.dart';
import 'package:wallet_app/data/model/register_model.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';
import 'package:wallet_app/data/remote/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  RegisterModel ? registerModel;


  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
required String cPassword,
    required String dueDate,
  }) async {
    emit(RegisterLoadingState());

   try{
     var result1=await  DioHelper.postData(
       //url: REGISTER,
         url: REGISTER,
         data: {
           'firstName':firstName,
           'lastName':lastName,
           'email':email,
           'password':password,
           'cPassword':cPassword,
           'dueDate':dueDate,
         });
     if(result1.data !=null) {
       registerModel = RegisterModel.fromJson(result1.data);
       //cache user token here
CacheHelper.saveData(key: 'email', value: email);
       CacheHelper.saveData(key: 'password', value: password);

       emit(RegisterSuccessState(registerModel: registerModel!));
     }
   }catch(e){
     emit(RegisterErrorState(e.toString()));
       print(e.toString());
   }

  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterChangeVisibilityState());
  }
}
