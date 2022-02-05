import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/createFirestore.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

class TransactionPageCubit extends Cubit<TransactionPageState> {
  TransactionPageCubit() : super(TransactionPageState());

  void inputproducto(String producto) {
    state.producto = producto;
    emit(state);
  }

  Future<void> search(BuildContext context) async {
    var producto = state.producto;

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String company = args["company"].toString();
    String email = args["email"].toString();

    //String code =  args["code"].toString();

    //await crearProduct(company, code, 'xxname', 'xxxxdescripcion', 'bodeg2', 55, 'cajas');

    List<dynamic>? transacciones = null;

    if (producto == 'vacio' || producto == '') {
      transacciones = await getAllTransactions(company);
    } else {
      transacciones = await getTransactions(company, producto);
    }

    state.transacciones = transacciones;
    emit(state);

    //var states = {'company': enterpriseName, 'name': name, 'email': email};
    //Navigator.popUntil(context, ModalRoute.withName('homepage'));
  }

   resultados(BuildContext context) {
    var producto = state.producto;

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String company = args["company"].toString();
    String email = args["email"].toString();

    //String code =  args["code"].toString();

    //await crearProduct(company, code, 'xxname', 'xxxxdescripcion', 'bodeg2', 55, 'cajas');

    List<dynamic>? transacciones = state.transacciones;

    transacciones = state.transacciones;

    List<Widget> resultado = [];

    if (transacciones != 'vacio' &&
        transacciones != '' &&
        transacciones != null) {
      transacciones.forEach((v) {
        resultado.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                v['producto'],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                v['cantidad'].toString(),
                style: TextStyle(fontSize: 20),
              ),
              Text(
                v['fecha'],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                v['cliente'],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                v['empleado'],
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ); //
      });
      return resultados;
    } else {

      resultado.add( Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('no hay resultados', style: TextStyle(fontSize: 20),),
          ],
        ),); //

      return resultado;
    }

    //var states = {'company': enterpriseName, 'name': name, 'email': email};
    //Navigator.popUntil(context, ModalRoute.withName('homepage'));
  }
}
