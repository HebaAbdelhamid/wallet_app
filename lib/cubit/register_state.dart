

import 'package:wallet_app/data/model/login_model.dart';
import 'package:wallet_app/data/model/register_model.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterModel? registerModel;

  RegisterSuccessState({this.registerModel});
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangeVisibilityState extends RegisterState {}
