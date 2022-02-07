import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/domain/Empleado.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_state.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';

class EmpleadosListPageCubit extends Cubit<EmpleadosListPageState>{
  EmpleadosListPageCubit() : super(EmpleadosPageWaitingState());

  void pressButton() {
    if (state is EmpleadosListDisplayState) {
      emit(EmpleadosPageWaitingState(
          empleadoName: (state as EmpleadosListDisplayState).empleadoName));
    }
  }

  void inputempleado(String empleadoName) {
    if (state is EmpleadosListDisplayState) {
      emit(EmpleadosListDisplayState(
          empleadoName: empleadoName,
          empleados: (state as EmpleadosListDisplayState).empleados));
    }
  }

  void search(BuildContext context) async {
    var empleadoName = (state as EmpleadosPageWaitingState).empleadoName;

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String company = args["company"].toString();

    List<Map<String, dynamic>> mapa;

    if (empleadoName == 'vacio' || empleadoName == '') {

      mapa = await getAllEmpleados(company);
      
    } else {
      mapa = await getEmpleados(company, empleadoName);
    }

    List<Empleado> empleados =
        mapa.map((e) => Empleado.fromJson(e)).toList();

    emit(EmpleadosListDisplayState(
        empleadoName: empleadoName, empleados: empleados));    
  }
}