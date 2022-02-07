import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_state.dart';

import 'package:tuempresa_ma/src/data/createFirestore.dart';

class AddProductPageCubit extends Cubit<AddProductPageState> {
  AddProductPageCubit() : super(InputProductInfoState());

  void inputName(String name) {
    emit(InputProductInfoState(
      nombre: name,
      cod_barras: (state as InputProductInfoState).cod_barras,
      caracteristicas: (state as InputProductInfoState).caracteristicas,
      precio: (state as InputProductInfoState).precio,
      unidad: (state as InputProductInfoState).unidad,
    ));
  }

  void inputCode(String code) {
    emit(InputProductInfoState(
      nombre: (state as InputProductInfoState).nombre,
      cod_barras: code,
      caracteristicas: (state as InputProductInfoState).caracteristicas,
      precio: (state as InputProductInfoState).precio,
      unidad: (state as InputProductInfoState).unidad,
    ));
  }

  void inputCaract(String caract) {
    emit(InputProductInfoState(
      nombre: (state as InputProductInfoState).nombre,
      cod_barras: (state as InputProductInfoState).cod_barras,
      caracteristicas: caract,
      precio: (state as InputProductInfoState).precio,
      unidad: (state as InputProductInfoState).unidad,
    ));
  }

  bool _isInt(String str) {
    try {
      var value = int.parse(str);
    } catch (e) {
      return false;
    }
    return true;
  }

  void inputPrecio(String precio) {
    if (_isInt(precio)) {
      emit(InputProductInfoState(
        nombre: (state as InputProductInfoState).nombre,
        cod_barras: (state as InputProductInfoState).cod_barras,
        caracteristicas: (state as InputProductInfoState).caracteristicas,
        precio: int.parse(precio),
        unidad: (state as InputProductInfoState).unidad,
      ));
    }
  }

  void inputUnidad(String unidad) {
    emit(InputProductInfoState(
      nombre: (state as InputProductInfoState).nombre,
      cod_barras: (state as InputProductInfoState).cod_barras,
      caracteristicas: (state as InputProductInfoState).caracteristicas,
      precio: (state as InputProductInfoState).precio,
      unidad: unidad,
    ));
  }

  Future<void> scanCode(BuildContext context) async {
    if (state is InputProductInfoState) {
      emit(WaitingAddProductPageState(
        nombre: (state as InputProductInfoState).nombre,
        cod_barras: (state as InputProductInfoState).cod_barras,
        caracteristicas: (state as InputProductInfoState).caracteristicas,
        precio: (state as InputProductInfoState).precio,
        unidad: (state as InputProductInfoState).unidad,
      ));

      final result = await Navigator.pushNamed(
        context,
        'scanpage',
      );

      if (result != null) {
        emit(InputProductInfoState(
          nombre: (state as WaitingAddProductPageState).nombre,
          cod_barras: result as String,
          caracteristicas:
              (state as WaitingAddProductPageState).caracteristicas,
          precio: (state as WaitingAddProductPageState).precio,
          unidad: (state as WaitingAddProductPageState).unidad,
        ));
      }
    }
  }

  Future<void> addProd(BuildContext context) async {
    if (state is InputProductInfoState) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      String company = args["company"].toString();

      crearProduct(
          company,
          (state as InputProductInfoState).cod_barras,
          (state as InputProductInfoState).nombre,
          (state as InputProductInfoState).caracteristicas,
          (state as InputProductInfoState).precio,
          (state as InputProductInfoState).unidad);

      Navigator.popUntil(context, ModalRoute.withName('homepage'));
    }
  }
}
