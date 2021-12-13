import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/homeplage_bloc/login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageState());

  void inputName(String newName) {
    state.username = newName;
    emit(state);
  }

  void inputPassword(String newPassword) {
    state.password = newPassword;
    emit(state);
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, 'testpage',
        arguments: state.username + ' ' + state.password);
  }
}
