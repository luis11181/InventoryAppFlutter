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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Inventario')),
      body: BlocBuilder<ProductListPageCubit, ProductListPageState>(
        builder: (context, state) {
          if (state is ProductListWaitingState) {
            context.read<ProductListPageCubit>().fetchProductInfo();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  'Resumen de productos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Busca un producto por su nombre',
                  style: Theme.of(context).textTheme.headline6,
                  // textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nombre de producto',
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
                  onChanged: (text) => context
                      .read<ProductListPageCubit>()
                      .inputProductName(text),
                ),
              ),
              SizedBox(
                  height: 400,
                  child: state is ProductListWaitingState
                      ? Center(child: CircularProgressIndicator())
                      : Text((state as ProductListDisplayState).productName)),
            ],
          );
        },
      ),
    );
  }
}
