import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bodegas_page_cubit.dart';
import 'bodegas_page_state.dart';

class BodegasPageView extends StatelessWidget {
  /// {@macro app_view}
  const BodegasPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Lista de bodegas"),
      ),
      body: BlocBuilder<BodegasPageCubit, BodegasPageState>(
        builder: (context, state) {
          if (state is BodegasWaitingState) {
            context.read<BodegasPageCubit>().changeToShow(context);
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BodegasShowState) {
            if (state.bodegas.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Crea una nueva bodega"),
                    SizedBox(
                      height: 20,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context
                            .read<BodegasPageCubit>()
                            .changeToCreate(context);
                      },
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              );
            } else {
              //return SizedBox();
              return ListView(
                children: [
                  ...state.bodegas.map((e) => cartBodega(e, context)).toList(),
                  ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 0, 160, 0),
                      child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<BodegasPageCubit>()
                                .changeToCreate(context);
                          },
                          child: const Icon(Icons.add)),
                    )
                  ]
                ],
              );
            }
          }

          return ListView(children: [
            Card(
              child: ListTile(
                title: Text(
                  'Creando bodega',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ...[
              ListTile(
                title: TextField(
                  onChanged: (text) {
                    context.read<BodegasPageCubit>().inputBodega(text);
                  },
                  decoration:
                      const InputDecoration(labelText: "Nombre de la bodega"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<BodegasPageCubit>()
                              .changeToShow(context);
                        },
                        child: const Icon(Icons.clear)),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<BodegasPageCubit>().newBodegas(context);
                          context
                              .read<BodegasPageCubit>()
                              .changeToShow(context);
                        },
                        child: const Icon(Icons.done))
                  ],
                ),
              )
            ],
          ]);
        },
      ),
    );
  }

  Card cartBodega(e, BuildContext context) {
    return Card(
        child: ExpansionTile(
      title: Text(' ${e.first['bodega']}'),
      children: [
        ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: e.length,
            itemBuilder: (BuildContext context, int index) {
              return vistaProductos(context, e[index]);
            })
      ],
    ));
  }

  Row vistaProductos(BuildContext context, producto) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: '\tCantidad: ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '${producto['cantidad']}'),
              TextSpan(
                  text: '\tProducto: ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '${producto['nombre']}'),
            ],
          ),
        ),
      ],
    );
  }
}
