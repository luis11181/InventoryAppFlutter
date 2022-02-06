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
      appBar: AppBar(title: const Text("Crea un nuevo producto")),
      body: BlocBuilder<AddProductPageCubit, AddProductPageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            onChanged: (text){
                              state.nombre = text;
                            },
                            decoration: InputDecoration(
                              labelText: 'Nombre del producto',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Theme.of(context).colorScheme.secondary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        FloatingActionButton(onPressed: (){},
                            child: Icon(Icons.add),
                        )
                      ],
                    ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        onChanged: (text){
                          state.cod_barras = text;
                        },
                        decoration: InputDecoration(
                          labelText: 'Código de barras o QR',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,'scanpage', arguments: state);
                        },
                        child: Text("Escanear")
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Flexible(
                  child: TextFormField(
                    onChanged: (text){
                      state.caracteristicas = text;
                    },
                    decoration: InputDecoration(
                      labelText: 'Características',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          state.precio = double.parse(text);
                        },
                        decoration: InputDecoration(
                          labelText: 'Precio',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Flexible(
                      child: TextFormField(
                        onChanged: (text){
                          state.unidad = text;
                        },
                        decoration: InputDecoration(
                          labelText: 'Unidad',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 80,)
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          context.read<AddProductPageCubit>().addProd(context);
        },
        label: const Text("Agregar"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
