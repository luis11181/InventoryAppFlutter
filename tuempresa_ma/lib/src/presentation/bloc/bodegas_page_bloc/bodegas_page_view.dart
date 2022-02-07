import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

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
      appBar: AppBar(title: const Text("Lista de bodegas"),),
      body: BlocBuilder<BodegasPageCubit, BodegasPageState>(
        builder: (context, state) {
          return state is BodegasWaitingState
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : ListView(
            children:[

              !(state as BodegasInputState).nuevo ? ElevatedButton(
                  onPressed: (){
                    (state as BodegasPageCubit).createwindow(true);
                    },
                  child: const Icon(Icons.add)) :
                  Column(
                    children: [
                      Flexible(
                        child: Row(
                          children:
                          [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "Nombre de la bodega"
                              ),
                              onChanged: (text){},
                            ),
                            const SizedBox(width: 100),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: "Dirección"
                              ),
                              onChanged: (text){},
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: () {

                          },
                              child: const Icon(Icons.done)
                          ),
                          ElevatedButton(onPressed: (){

                          },
                              child: const Icon(Icons.clear)
                          )
                        ],
                      ),
                    ],
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
