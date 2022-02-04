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

  

  
}
