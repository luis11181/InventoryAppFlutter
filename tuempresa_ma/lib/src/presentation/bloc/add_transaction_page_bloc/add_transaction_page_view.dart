import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/add_transaction_page_bloc/add_transaction_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/add_transaction_page_bloc/add_transaction_page_state.dart';

class AddTransactionPageView extends StatelessWidget {
  const AddTransactionPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String code = args["code"].toString();

    return Scaffold(
      appBar: AppBar(title: const Text("Crea un nueva transacción")),
      body: BlocBuilder<AddTransactionPageCubit, AddTransactionPageState>(
        builder: (context, state) {
          bool _value = false;
          int val = -1;
          if (state is WaitingAddTransactionState) {
            return const Center(
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
                            initialValue: (state as InputTransactionInfoState)
                                .barCode
                                .toString(),
                            onChanged: (text) {
                              context
                                  .read<AddTransactionPageCubit>()
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
                                  .read<AddTransactionPageCubit>()
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
                    Row(
                      children: [
                        Flexible(
                          child: ListTile(
                            title: Text(
                              "Agregar",
                              style: TextStyle(fontSize: 12),
                            ),
                            leading: Radio(
                              value: true,
                              groupValue:
                                  (state as InputTransactionInfoState).add,
                              onChanged: (onChanged) {
                                context
                                    .read<AddTransactionPageCubit>()
                                    .checkRadio(true);
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListTile(
                            title: Text(
                              "Remover",
                              style: TextStyle(fontSize: 12),
                            ),
                            leading: Radio(
                                value: false,
                                groupValue:
                                    (state as InputTransactionInfoState).add,
                                onChanged: (onChanged) {
                                  context
                                      .read<AddTransactionPageCubit>()
                                      .checkRadio(false);
                                }),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: TextFormField(
                        initialValue: (state as InputTransactionInfoState)
                            .client
                            .toString(),
                        onChanged: (text) {
                          context
                              .read<AddTransactionPageCubit>()
                              .inputClient(text);
                        },
                        decoration: InputDecoration(
                          labelText: 'Cliente',
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
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: TextFormField(
                        initialValue: (state as InputTransactionInfoState)
                            .warehouse
                            .toString(),
                        onChanged: (text) {
                          context
                              .read<AddTransactionPageCubit>()
                              .inputWarehouse(text);
                        },
                        decoration: InputDecoration(
                          labelText: 'Bodega',
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Cantidad: ${(state as InputTransactionInfoState).quantity}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            context
                                .read<AddTransactionPageCubit>()
                                .removeButton();
                          },
                          child: Icon(Icons.remove),
                          mini: true,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            context.read<AddTransactionPageCubit>().addButton();
                          },
                          mini: true,
                          child: Icon(Icons.add),
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
          context.read<AddTransactionPageCubit>().addTransaction(context);
        },
        label: const Text("Continuar"),
        icon: Icon(Icons.arrow_right_alt_rounded),
      ),
    );
  }
}
