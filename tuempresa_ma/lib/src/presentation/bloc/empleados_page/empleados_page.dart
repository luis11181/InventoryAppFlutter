import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_state.dart';
import 'empleados_page_cubit.dart';
import 'empleados_page_view.dart';

class EmpleadosListPage extends StatelessWidget {
  const EmpleadosListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmpleadosListPageCubit(),
      child: const EmpleadosListPageView(),
    );
  }
}