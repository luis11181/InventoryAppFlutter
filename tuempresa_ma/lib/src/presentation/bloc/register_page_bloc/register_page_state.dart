import 'dart:ffi';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RegisterPageState extends Equatable {
  RegisterPageState({
    this.name = '',
    this.lastName = '',
    this.username = '',
    this.password = '',
    this.email = '',
    this.enterpriseName = '',
    this.confirmPassword = '',
  }) : readyToSubmit = false;

  String name;
  String lastName;
  String username;
  String email;
  String enterpriseName;
  String password;
  String confirmPassword;
  bool readyToSubmit;

  @override
  List<Object?> get props => [username, password];
}
