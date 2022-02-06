import 'package:flutter/cupertino.dart';
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

    List<Map<String, dynamic>> mapa;

    if (productName == 'vacio' || productName == '') {

      mapa = await getAllProducts(company);
      
    } else {
      mapa = await getProducts(company, productName);
    }

    List<Product> products =
        mapa.map((e) => Product.fromJson(e)).toList();

    emit(ProductListDisplayState(
        productName: productName, products: products));    
  }
}
