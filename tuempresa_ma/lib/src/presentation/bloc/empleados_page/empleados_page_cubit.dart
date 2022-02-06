import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/domain/Empleado.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_state.dart';

class EmpleadosPageCubit extends Cubit<EmpleadosPageState>{
  EmpleadosPageCubit(EmpleadosPageState state) : super(state);

  void getEmpleados(List<Empleado> e) {

  }
}