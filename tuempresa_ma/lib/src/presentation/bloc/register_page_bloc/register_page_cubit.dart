import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuempresa_ma/src/data/authentication.dart';

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

      signUp(state.email, state.password, state.name, state.lastName, state.username, state.enterpriseName);

      //createBussiness(state.enterpriseName);

          Navigator.pushNamed(context, 'testpage',
          arguments: state.name +
              '\n' +
              state.lastName +
              '\n' +
              state.username +
              '\n' +
              state.email +
              '\n' +
              state.enterpriseName +
              '\n' +
              state.password);
      }


    }
    emit(state);
  }

