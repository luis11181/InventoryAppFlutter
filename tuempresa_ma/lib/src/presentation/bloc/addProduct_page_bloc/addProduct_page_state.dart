import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddProductPageState extends Equatable {
  AddProductPageState({
    this.username = '',
    this.password = '',
  });

  String username;
  String password;

  @override
  List<Object?> get props => [username, password];
}
