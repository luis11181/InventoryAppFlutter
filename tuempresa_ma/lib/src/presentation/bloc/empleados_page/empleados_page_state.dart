import 'package:tuempresa_ma/src/domain/Empleado.dart';

abstract class EmpleadosPageState {}

class EmpleadosWaitingState implements EmpleadosPageState {}

class EmpleadosInputState implements EmpleadosPageState {
  EmpleadosInputState({
    required this.empleados
  });

  List<Empleado> empleados;
}