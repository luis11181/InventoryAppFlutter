import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/domain/product.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page_state.dart';

import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

class ProductListPageCubit extends Cubit<ProductListPageState> {
  ProductListPageCubit() : super(ProductPageWaitingState());

  void pressButton() {
    if (state is ProductListDisplayState) {
      emit(ProductPageWaitingState(
          productName: (state as ProductListDisplayState).productName));
    }
  }

  void inputproducto(String productName) {
    if (state is ProductListDisplayState) {
      emit(ProductListDisplayState(
          productName: productName,
          products: (state as ProductListDisplayState).products));
    }
  }

  void search(BuildContext context) async {
    var productName = (state as ProductPageWaitingState).productName;

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String company = args["company"].toString();

    //String code =  args["code"].toString();

    //await crearProduct(company, code, 'xxname', 'xxxxdescripcion', 'bodeg2', 55, 'cajas');

    List<Map<String, dynamic>> mapa;

    if (productName == 'vacio' || productName == '') {
      mapa = await getAllProducts(company);
    } else {
      mapa = await getProducts(company, productName);
    }

    List<Product> products = mapa.map((e) => Product.fromJson(e)).toList();

    emit(ProductListDisplayState(productName: productName, products: products));
  }

  // Future<void> fetchProductInfo() async {
  //   //TODO recibe nombre

  //   await Future.delayed(
  //       Duration(seconds: 2)); //simula recoger los productos de firebase
  //   emit(ProductListDisplayState(producto: [])); //emitir la lista de producto
  // }

  // void inputProductName(String name) {
  //   if (state is ProductListDisplayState) {
  //     emit(ProductListDisplayState(
  //         productName: name,
  //         producto: (state as ProductListDisplayState).producto));
  //   }
  // }

  // List<Product> _filterList(List<Product> list, String name) {

  //   //a partir de la lista y el nombre retornar
  //   return [];
  // }

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
