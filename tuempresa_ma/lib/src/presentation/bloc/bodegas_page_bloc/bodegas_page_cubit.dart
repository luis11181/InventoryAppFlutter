import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'package:tuempresa_ma/src/data/initFirebase.dart';

import 'bodegas_page_state.dart';

class BodegasPageCubit extends Cubit<BodegasPageState> {
  BodegasPageCubit() : super(BodegasWaitingState());

  Future<void> getBodegas(BuildContext context) async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String company = args["company"].toString();

    List<Map<String, dynamic>> mapa = await getAllBodegas(company);
  }

  void changeToCreate(){
    //Funcion para traer de firestore la lista de bodegas
    emit(BodegasCreateState(bodegas: (state as BodegasShowState).bodegas, nueva_bodega: ""));
  }

  void changeToShow(){
    //Funcion para traer de firestore la lista de bodegas
    emit(BodegasShowState(bodegas: (state as BodegasCreateState).bodegas));
  }

  void inputBodega(String bodega){
    if(state is BodegasCreateState){
      emit(BodegasCreateState(bodegas: (state as BodegasCreateState).bodegas, nueva_bodega: bodega));
    }
  }
}
