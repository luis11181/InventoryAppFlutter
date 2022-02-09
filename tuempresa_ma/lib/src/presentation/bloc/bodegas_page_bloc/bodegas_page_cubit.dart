import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/data/createFirestore.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'bodegas_page_state.dart';

class BodegasPageCubit extends Cubit<BodegasPageState> {
  BodegasPageCubit() : super(BodegasWaitingState());

  Future<void> newBodegas(BuildContext context) async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String company = args["company"].toString();

    crearBodega(company, (state as BodegasCreateState).nueva_bodega);
  }

  void changeToCreate(BuildContext context) async{
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String company = args["company"].toString();

    List<Map<String, dynamic>> mapa = await getAllbodegas(company);
    List lista = mapa.map((e) => e["name"]).toList();

    emit(BodegasCreateState(bodegas: lista, nueva_bodega: ""));
  }

  void changeToShow(BuildContext context) async{

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String company = args["company"].toString();

    List<Map<String, dynamic>> mapa = await getAllbodegas(company);
    List lista = mapa.map((e) => e["name"]).toList();

    emit(BodegasShowState(bodegas: lista));
  }

  void inputBodega(String bodega){
    if(state is BodegasCreateState){
      emit(BodegasCreateState(bodegas: (state as BodegasCreateState).bodegas, nueva_bodega: bodega));
    }
  }
}
