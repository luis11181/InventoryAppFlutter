import 'package:tuempresa_ma/src/domain/Empleado.dart';

abstract class EmpleadosListPageState {}

class EmpleadosListDisplayState implements EmpleadosListPageState {
  EmpleadosListDisplayState({
    required this.empleados, 
    required this.empleadoName
    });

  List<Empleado> empleados;
  String empleadoName;
}

class EmpleadosPageWaitingState implements EmpleadosListPageState {
  EmpleadosPageWaitingState({this.empleadoName = ""});
  String empleadoName;
}
