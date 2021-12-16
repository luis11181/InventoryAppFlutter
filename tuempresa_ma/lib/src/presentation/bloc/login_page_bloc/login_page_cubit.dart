import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/storeQueries.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(LoginInputState());

  void inputUsername(String newUsername) {
    if (state is LoginInputState) {
      (state as LoginInputState).email = newUsername;
      emit(state);
    }
  }

  void inputPassword(String newPassword) {
    if (state is LoginInputState) {
      (state as LoginInputState).password = newPassword;
      emit(state);
    }
  }

  Future<void> login(BuildContext context) async {
    if (state is LoginInputState) {
      final email = (state as LoginInputState).email;
      final password = (state as LoginInputState).password;
      emit(LoginWaitingState());

    bool shouldNavigate = await signIn(email, password);
    var companyName = await getCompanyName(email);
    var name = await getName(email);

    if (shouldNavigate == true && companyName != null) {

      var states = {'company': companyName, 'name': name, 'email': email};
     
      Navigator.pushNamed(context, 'scanpage',
          arguments: states);

        emit(LoginInputState());
      } else {
        emit(LoginInputState(email: email, password: password));
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
