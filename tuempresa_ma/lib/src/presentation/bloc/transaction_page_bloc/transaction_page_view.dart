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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //Text('el codigo es: $code'),
            
              Padding(
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
                  initialValue: state
                      .producto, //* pedia el ususario pero se requiere es el correo, por lo tanto se cambio el texto para que reciba el correo y no el usuario.
                  onChanged: (producto) =>
                      context.read<TransactionPageCubit>().inputproducto(producto),
                ),
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        context.read<TransactionPageCubit>().search(context),
                    child: const Text('buscar'),
                  ),
                ],
              ),

              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: context.read<TransactionPageCubit>().resultados(context),
               
                )
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