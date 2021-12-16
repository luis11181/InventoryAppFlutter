import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/store.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit() : super(RegisterPageState());

  void inputName(String newName) {
    state.name = newName;
    emit(state);
  }

  void inputLastName(String newLastName) {
    state.lastName = newLastName;
    emit(state);
  }

  void inputUsername(String newUsername) {
    state.username = newUsername;
    emit(state);
  }

  void inputEmail(String newEmail) {
    state.email = newEmail;
    emit(state);
  }

  void inputEnterpriseName(String newEnterpriseName) {
    state.enterpriseName = newEnterpriseName;
    emit(state);
  }

  void inputPassword(String newPassword) {
    state.password = newPassword;
    emit(state);
  }

  void inputConfirmPassword(String newPassword) {
    state.confirmPassword = newPassword;
    emit(state);
  }

  Future<void> register(BuildContext context, GlobalKey<FormState> key) async {
    final isReady = key.currentState!.validate();
    // ignore: avoid_print
    print(isReady);
    state.readyToSubmit = isReady;
    if (isReady) {

      final resolve = await signUp(state.email, state.password, state.name, state.lastName, state.username, state.enterpriseName);

      addUser(state.name, state.lastName, state.enterpriseName, state.email, state.username );

      addEmpresa(state.name, state.lastName, state.enterpriseName, state.email, state.username );

      //createBussiness(state.enterpriseName);
      if (resolve=='funciono') {
  
        var states = {'company': state.enterpriseName, 'name': state.name, 'email': state.email};
        
        Navigator.pushNamed(context, 'scanpage', 
            arguments: states);
        }
        else{
          //*imprimir error en pantalla
          //TODO implementar error en pantalla
        }
     }


    }
    emit(state);
  }

