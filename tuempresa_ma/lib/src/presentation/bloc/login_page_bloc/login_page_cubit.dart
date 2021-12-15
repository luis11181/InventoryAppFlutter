import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginPageState());

  void inputUsername(String newUsername) {
    state.username = newUsername;
    emit(state);
  }

  void inputPassword(String newPassword) {
    state.password = newPassword;
    emit(state);
  }

  Future<void> login(BuildContext context) async {

    //* dice que recibe el username, pero se requiere el password por eso se cambio el texto que ve el ususario, uy realmente recibe es el correo, por lo tanto la funcion sign in funciona asi
    bool shouldNavigate = await signIn(state.username, state.password);

    if (shouldNavigate) {
      Navigator.pushNamed(context, 'testpage',
          arguments: state.username + ' ' + state.password);
    }
  }

  void goRegister(BuildContext context) {
    Navigator.pushNamed(context, 'register');
  }
}
