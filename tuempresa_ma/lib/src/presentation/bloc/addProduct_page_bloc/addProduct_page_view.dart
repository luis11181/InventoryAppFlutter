import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_state.dart';

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
          if (state is WaitingAddProductPageState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue:
                                (state as InputProductInfoState).nombre,
                            onChanged: (text) {
                              context
                                  .read<AddProductPageCubit>()
                                  .inputName(text);
                            },
                            decoration: InputDecoration(
                              labelText: 'Nombre del producto',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue:
                                (state as InputProductInfoState).cod_barras,
                            onChanged: (text) {
                              context
                                  .read<AddProductPageCubit>()
                                  .inputCode(text);
                            },
                            decoration: InputDecoration(
                              labelText: 'Código de barras o QR',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            onPressed: () {
                              context
                                  .read<AddProductPageCubit>()
                                  .scanCode(context);
                            },
                            child: Icon(Icons.qr_code_scanner),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: TextFormField(
                        initialValue:
                            (state as InputProductInfoState).caracteristicas,
                        onChanged: (text) {
                          context.read<AddProductPageCubit>().inputCaract(text);
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
                            initialValue: (state as InputProductInfoState)
                                .precio
                                .toString(),
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              context
                                  .read<AddProductPageCubit>()
                                  .inputPrecio(text);
                            },
                            decoration: InputDecoration(
                              labelText: 'Precio',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: TextFormField(
                            initialValue:
                                (state as InputProductInfoState).unidad,
                            onChanged: (text) {
                              context
                                  .read<AddProductPageCubit>()
                                  .inputUnidad(text);
                            },
                            decoration: InputDecoration(
                              labelText: 'Unidad',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<AddProductPageCubit>().addProd(context);
        },
        label: const Text("Agregar"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
