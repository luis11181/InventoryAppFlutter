import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/storeQueries.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(InputState());

  void inputUsername(String newUsername) {
    if (state is InputState) {
      (state as InputState).email = newUsername;
      emit(state);
    }
  }

  void inputPassword(String newPassword) {
    if (state is InputState) {
      (state as InputState).password = newPassword;
      emit(state);
    }
  }

  Future<void> login(BuildContext context) async {
    if (state is InputState) {
      final email = (state as InputState).email;
      final password = (state as InputState).password;
      emit(WaitingState());
      bool shouldNavigate = await signIn(email, password);
      if (shouldNavigate) {
        //TODO SAVE THE COMPANY NAME AS GLOBAL STATE, SO IT CAN BE USED IN ALL QUERIES, SE CREO LA FUNCION , PERO ESTA NO SIRVE PQ RECIBE UN FUTURO  Y NO UN STRING

        //String companyName = 'ddd'; //await  getCompanyName(state.username);//username es el correo en este caso
        //getCompanyName(state.username);

        Navigator.pushNamed(context, 'testpage',
            arguments: email + ' ' + password);
        emit(InputState());
      } else {
        emit(InputState(email: email, password: password));
        final snackBar = SnackBar(
          //TODO especificar error
          content: Text('Error'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  void goRegister(BuildContext context) {
    Navigator.pushNamed(context, 'register');
  }
}
