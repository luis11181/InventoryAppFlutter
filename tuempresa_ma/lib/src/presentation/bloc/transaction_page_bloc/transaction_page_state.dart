import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransactionPageState extends Equatable {
  TransactionPageState({
    this.producto = '',
    this.transacciones ,
  });

  String producto;
   List<dynamic>? transacciones;

  @override
  List<Object?> get props => [producto];
}
