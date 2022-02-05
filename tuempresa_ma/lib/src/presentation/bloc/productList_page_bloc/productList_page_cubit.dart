import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'package:tuempresa_ma/src/data/initFirebase.dart';

class ProductListPageCubit extends Cubit<ProductListPageState> {
  ProductListPageCubit() : super(ProductListInputState());

  void inputProductName(String newName) {
    if (state is ProductListInputState) {
      (state as ProductListInputState).nombre = newName;
      emit(state);
    }
  }

  // Future<void> register(BuildContext context, GlobalKey<FormState> key) async {
  //   if (state is ProductListInputState) {
  //     final isReady = key.currentState!.validate();
  //     (state as ProductListInputState).readyToSubmit = isReady;
  //     if (isReady) {
  //       final nombre = (state as ProductListInputState).nombre;

  //       emit(ProductListWaitingState());

  //       final result = await productSearch(nombre);

  //       if (result == 'funciono') {
  //         //TODO SAVE THE COMPANY NAME AS GLOBAL STATE, SO IT CAN BE USED IN ALL QUERIES
  //         emit(ProductListInputState());

  //         var states = {
  //           'nombre': nombre,
  //         };
  //       } else {
  //         emit(ProductListInputState(nombre: nombre));
  //         final snackBar = SnackBar(
  //           //TODO especificar error
  //           content: Text('Error'),
  //         );
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       }
  //     } else {
  //       emit(state);
  //     }
  //   }
  // }
}