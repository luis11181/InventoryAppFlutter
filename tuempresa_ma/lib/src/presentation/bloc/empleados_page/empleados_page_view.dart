import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'package:tuempresa_ma/src/domain/Empleado.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_state.dart';

import 'empleados_page_cubit.dart';

class EmpleadosPageView extends StatelessWidget{
  const EmpleadosPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        appBar: AppBar(title: Text("Lista de empleados")),
        body: BlocBuilder<EmpleadosPageCubit,EmpleadosPageState>(
            builder: (context, state){
              if (state is EmpleadosWaitingState) {
                context.read<EmpleadosPageCubit>().retrieveEmpleados(context);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('el codigo es: $code'),

                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: state is EmpleadosWaitingState
                          ? const Center(child: CircularProgressIndicator())
                          : ListView(
                          children: (state as EmpleadosInputState)
                              .empleados
                              .map((e) => Card(
                              child: ExpansionTile(
                                title: Text(' ${e.nombre}  ${e.apellido}'),
                                children: [
                                  Text('Cantidad: ${e.correo}'),
                                  Text('Cliente: ${e.usuario}'),
                                ],
                              )))
                              .toList()) // state.transactions

                  ),
                ],
              );
            }
        )

    );
  }

  Widget tarjeta(Empleado e){
    return Card(
        child: Expanded(
          child: ExpansionTile(
            title: Text("${e.nombre} ${e.apellido}"),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('correo: ${e.correo}'),
                    Text('usuario: ${e.usuario}'),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

}