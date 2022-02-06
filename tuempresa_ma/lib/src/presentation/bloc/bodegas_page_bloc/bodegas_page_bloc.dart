import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'package:tuempresa_ma/src/data/initFirebase.dart';

import 'bodegas_page_state.dart';

class BodegasPageCubit extends Cubit<BodegasPageState> {
  BodegasPageCubit() : super(BodegasInputState());

  void inputUsername(String newUsername) {
    if (state is LoginInputState) {
      (state as LoginInputState).email = newUsername;
      emit(state);
    }
  }

  Future<void> login(BuildContext context) async {
    if (state is LoginInputState) {
      final email = (state as LoginInputState).email;
      final password = (state as LoginInputState).password;
      emit(BodegasWaitingState());

      bool shouldNavigate = await signIn(email, password);
      var companyName = await getCompanyName(email);
      var name = await getName(email);

      if (shouldNavigate == true && companyName != null) {

        var states = {'company': companyName, 'name': name, 'email': email};

        //Navigator.pushNamed(context, 'homepage',
        //  arguments: states);
        Navigator.pushNamed(
          context,
          'homepage',
          arguments: states,
        );

        emit(BodegasInputState());
      } else {
        emit(BodegasInputState());
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
