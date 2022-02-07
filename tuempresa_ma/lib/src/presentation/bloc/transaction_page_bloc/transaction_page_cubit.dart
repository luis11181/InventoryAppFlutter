import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/domain/transaction.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page_state.dart';

import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

class TransactionPageCubit extends Cubit<TransactionPageState> {
  TransactionPageCubit() : super(WaitingState());

  void pressButton() {
    if (state is DisplayTransactionListState) {
      emit(WaitingState(
          producto: (state as DisplayTransactionListState).producto));
    }
  }

  void inputproducto(String producto) {
    if (state is DisplayTransactionListState) {
      emit(DisplayTransactionListState(
          producto: producto,
          transacciones: (state as DisplayTransactionListState).transacciones));
    }
  }

  void search(BuildContext context) async {
    var producto = (state as WaitingState).producto;

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String company = args["company"].toString();
    String email = args["email"].toString();

    //String code =  args["code"].toString();

    //await crearProduct(company, code, 'xxname', 'xxxxdescripcion', 'bodeg2', 55, 'cajas');

    List<Map<String, dynamic>> mapa;

    if (producto == 'vacio' || producto == '') {
      mapa = await getAllTransactions(company);
    } else {
      mapa = await getTransactions(company, producto);
    }

    List<Transaccion> transacciones =
        mapa.map((e) => Transaccion.fromJson(e)).toList();

    emit(DisplayTransactionListState(
        producto: producto, transacciones: transacciones));

    //String code =  args["code"].toString();

    // //await crearProduct(company, code, 'xxname', 'xxxxdescripcion', 'bodeg2', 55, 'cajas');

    // List<Widget>? resultado = [];

    // if (transacciones != 'vacio' &&
    //     transacciones != '' &&
    //     transacciones != null) {
    //   transacciones.forEach((v) {
    //     resultado.add(
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Text(
    //             v['producto'],
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           Text(
    //             v['cantidad'].toString(),
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           Text(
    //             v['fecha'],
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           Text(
    //             v['cliente'],
    //             style: TextStyle(fontSize: 20),
    //           ),
    //           Text(
    //             v['empleado'],
    //             style: TextStyle(fontSize: 20),
    //           ),
    //         ],
    //       ),
    //     ); //
    //   });

    //   state.transacciones = resultado;
    //   emit(state);

    //   return resultado;
    // } else {

    //   resultado.add( Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         Text('no hay resultados', style: TextStyle(fontSize: 20),),
    //       ],
    //     ),); //

    //    state.transacciones = resultado;
    //    emit(state);

    //   return resultado;
    // }

    //var states = {'company': enterpriseName, 'name': name, 'email': email};
    //Navigator.popUntil(context, ModalRoute.withName('homepage'));
  }
}
