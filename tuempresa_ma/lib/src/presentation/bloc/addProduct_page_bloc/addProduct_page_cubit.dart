import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/storeQueries.dart';

class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit() : super(AddProductPageState(nombre: "nombre"));

  void inputcantidad(int cantidad) {
    state.cantidad = cantidad;
    emit(state);
  }

  Future<void> changeCantidad(BuildContext context, String operacion) async {
    var cantidad = state.cantidad;

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    

    String company = args["company"].toString();

    String code = args["code"].toString();

    if (operacion == 'restar') {
      cantidad = cantidad * -1;
    }

    updateCantidad(company, cantidad, code);


    //var states = {'company': enterpriseName, 'name': name, 'email': email};
    Navigator.popUntil(context, ModalRoute.withName('homepage'));

  }
}
