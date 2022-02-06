// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page_state.dart';

import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

class ProductListPageView extends StatelessWidget {
  ProductListPageView({Key? key}) : super(key: key);

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
      appBar: AppBar(title: const Text('Productos')),
      body: BlocBuilder<ProductListPageCubit, ProductListPageState>(
        builder: (context, state) {
          if (state is ProductPageWaitingState) {
            context.read<ProductListPageCubit>().search(context);
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
                        onChanged: (producto) => context
                            .read<ProductListPageCubit>()
                            .inputproducto(producto),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<ProductListPageCubit>().pressButton(),
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
                  child: state is ProductPageWaitingState
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: (state as ProductListDisplayState)
                              .products
                              .map((e) => Card(
                                      child: ExpansionTile(
                                    title: Text(' ${e.nombre} '),
                                    children: [
                                      Row(
                                        children: [
                                          Text('Cantidad: '),
                                          Text('${e.cantidad}'),
                                        ],
                                      ),
                                      Text('Descripción: ${e.descripcion}'),
                                      Text('Precio: ${e.precio}'),
                                      Text(
                                          'Codigo de barras: ${e.productBarcode}'),
                                      Text('Unidad: ${e.unidad}'),
                                    ],
                                  )))
                              .toList()) // state.transactions

                  ),
            ],
          );
        },
      ),
    );
  }
}
