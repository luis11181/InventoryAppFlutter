import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/store.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit() : super(RegisterInputState());

  void inputName(String newName) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).name = newName;
      emit(state);
    }
  }

  void inputLastName(String newLastName) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).lastName = newLastName;
      emit(state);
    }
  }

  void inputEmail(String newEmail) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).email = newEmail;
      emit(state);
    }
  }

  void inputUsername(String newUsername) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).username = newUsername;
      emit(state);
    }
  }

  void inputEnterpriseName(String newEnterpriseName) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).enterpriseName = newEnterpriseName;
      emit(state);
    }
  }

  void inputPassword(String newPassword) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).password = newPassword;
      emit(state);
    }
  }

  void inputConfirmPassword(String newPassword) {
    if (state is RegisterInputState) {
      (state as RegisterInputState).confirmPassword = newPassword;
      emit(state);
    }
  }

  Future<void> register(BuildContext context, GlobalKey<FormState> key) async {


    if (state is RegisterInputState) {
      final isReady = key.currentState!.validate();
      (state as RegisterInputState).readyToSubmit = isReady;
      if (isReady) {
        final email = (state as RegisterInputState).email;
        final password = (state as RegisterInputState).password;
        final name = (state as RegisterInputState).name;
        final lastName = (state as RegisterInputState).lastName;
        final username = (state as RegisterInputState).username;
        final enterpriseName = (state as RegisterInputState).enterpriseName;

        emit(RegisterWaitingState());

        final result = await signUp(
            email, password, name, lastName, username, enterpriseName);

        addUser(name, lastName, enterpriseName, email, username);

        addEmpresa(name, lastName, enterpriseName, email, username);

        //createBussiness(state.enterpriseName);
        if (result == 'funciono') {
          //TODO SAVE THE COMPANY NAME AS GLOBAL STATE, SO IT CAN BE USED IN ALL QUERIES
          emit(RegisterInputState());

          var states = {'company': enterpriseName, 'name': name, 'email': email};
        
        Navigator.pushNamed(context, 'homepage', 
            arguments: states);
        
        } else {
          emit(RegisterInputState(
            email: email,
            username: username,
            name: name,
            lastName: lastName,
            enterpriseName: enterpriseName,
          ));
          final snackBar = SnackBar(
            //TODO especificar error
            content: Text('Error'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        emit(state);
      }
    }
  }
}
