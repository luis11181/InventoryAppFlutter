import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuempresa_ma/src/domain/transaction.dart';




// ignore: must_be_immutable
abstract class  TransactionPageState {}

class DisplayTransactionListState extends TransactionPageState {
  DisplayTransactionListState({
    required this.producto ,
    required this.transacciones,
  });

  String producto;
   List<Transaccion> transacciones;


}

class WaitingState extends TransactionPageState {
  WaitingState({ this.producto = ""});

  String producto;
}
