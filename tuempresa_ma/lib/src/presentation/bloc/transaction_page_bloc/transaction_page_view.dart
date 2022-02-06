// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page_state.dart';

import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

class TransactionPageView extends StatelessWidget {
  /// {@macro app_view}
  const TransactionPageView({Key? key}) : super(key: key);

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
      appBar: AppBar(title: const Text('Transacciones')),
      body: BlocBuilder<TransactionPageCubit, TransactionPageState>(
        builder: (context, state) {
          if (state is WaitingState) {
            context.read<TransactionPageCubit>().search(context);
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
                        //* pedia el ususario pero se requiere es el correo, por lo tanto se cambio el texto para que reciba el correo y no el usuario.
                        onChanged: (producto) => context
                            .read<TransactionPageCubit>()
                            .inputproducto(producto),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<TransactionPageCubit>().pressButton(),
                    child: const Text('buscar'),
                  ),
                ],
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: state is WaitingState
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: (state as DisplayTransactionListState)
                              .transacciones
                              .map((e) => Card(
                                      child: ExpansionTile(
                                    title: Text(' ${e.producto}  ${e.fecha}'),
                                    children: [
                                      Text('Cantidad: ${e.cantidad}'),
                                      Text('Cliente: ${e.cliente}'),
                                      Text('Responsable: ${e.empleado}'),
                                    ],
                                  )))
                              .toList()) // state.transactions

                  ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.brightness_6),
        mini: true,
        onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      ),
    );
  }
}
