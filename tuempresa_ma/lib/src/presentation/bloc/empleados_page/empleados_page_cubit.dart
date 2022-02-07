import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/domain/Empleado.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_state.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

class EmpleadosPageCubit extends Cubit<EmpleadosPageState> {
  EmpleadosPageCubit(EmpleadosPageState state) : super(state);

  Future<void> retrieveEmpleados(BuildContext context) async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String company = args["company"].toString();

    List<Map<String, dynamic>> mapa = await getAllEmpleados(company);
    List<Empleado> empleados = mapa.map((e) => Empleado.fromMap(e)).toList();

    emit(EmpleadosInputState(empleados: empleados));
  }
}
