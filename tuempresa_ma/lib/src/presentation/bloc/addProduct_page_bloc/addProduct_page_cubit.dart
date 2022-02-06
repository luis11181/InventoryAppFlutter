import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/createFirestore.dart';

class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit() : super(AddProductPageState());

  Future<void> addProd(BuildContext context) async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String company = args["company"].toString();

    print(
        '${company} ${state.cod_barras}, ${state.nombre}, ${state.caracteristicas} ${state.precio}  ${state.unidad}');

    crearProduct(company, state.cod_barras, state.nombre, state.caracteristicas,
        state.precio, state.unidad);

    //await crearProduct(company, code, 'xxname', 'xxxxdescripcion', 'bodeg2', 55, 'cajas');

    //transaccion(company, cantidad, code, email, cliente, bodega);

    //var states = {'company': enterpriseName, 'name': name, 'email': email};
    Navigator.popUntil(context, ModalRoute.withName('homepage'));
  }
}
