import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page_state.dart';


class EmpleadosListPageView extends StatelessWidget {
  const EmpleadosListPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    //String code = args["code"].toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Empleados')),
      body: BlocBuilder<EmpleadosListPageCubit, EmpleadosListPageState>(
        builder: (context, state) {
          if (state is EmpleadosPageWaitingState) {
            context.read<EmpleadosListPageCubit>().search(context);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text('el codigo es: $code'),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Producto a buscar:',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (empleado) => context
                            .read<EmpleadosListPageCubit>()
                            .inputempleado(empleado),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<EmpleadosListPageCubit>().pressButton(),
                    child: const Icon(Icons.search),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(2),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: state is EmpleadosPageWaitingState
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        children: (state as EmpleadosListDisplayState)
                            .empleados
                            .map((e) => Card(
                                    child: ExpansionTile(
                                  title: Text('${e.apellido}, ${e.nombre}'),
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '\tNombre: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(text: '${e.nombre}'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '\tApellido: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(text: '${e.apellido}'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '\tUsuario: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(text: '${e.usuario}'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: DefaultTextStyle.of(context)
                                                .style,
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: '\tCorreo: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(text: '${e.correo}'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [Text('')],
                                    ),
                                  ],
                                )))
                            .toList()), // state.transactions
              ),
            ],
          );
        },
      ),
    );
  }
}