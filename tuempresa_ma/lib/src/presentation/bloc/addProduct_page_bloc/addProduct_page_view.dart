// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_state.dart';

import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

class AddProductPageView extends StatelessWidget {
  /// {@macro app_view}
  const AddProductPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String code = args["code"].toString();

    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Add Product')),
      body: BlocBuilder<AddProductPageCubit, AddProductPageState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text('el codigo es: $code'),
            
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cantidad a agregar o disminuir',
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
                      .cantidad, //* pedia el ususario pero se requiere es el correo, por lo tanto se cambio el texto para que reciba el correo y no el usuario.
                  onChanged: (number) =>
                      context.read<AddProductPageCubit>().inputcantidad(number),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            context.read<AddProductPageCubit>().changeCantidad(context, 'restar'),
                        child: const Text('Retirar'),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<AddProductPageCubit>().changeCantidad(context, 'sumar'),
                        child: const Text('Añadir'),
                      ),
                    ],
                  )),
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
