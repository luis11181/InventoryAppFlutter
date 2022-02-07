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

          if (state is BodegasWaitingState){
            context.read<BodegasPageCubit>().getBodegas(context);
            return const Center(child: CircularProgressIndicator());
          }

          if(state is BodegasShowState){

            if(state.bodegas == []){
              return Center(
                child: Column(
                children: [
                  const Text("Crea una nueva bodega"),
                  FloatingActionButton(
                    onPressed:(){
                      context.read<BodegasPageCubit>().changeToCreate();
                    }, child: const Icon(Icons.add),
                  )
                ],
                ),
              );
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView(
                    children: state.bodegas.map((e) => Text(e)).toList(),
                  ),
                  ElevatedButton(
                      onPressed:(){
                        context.read<BodegasPageCubit>().changeToCreate();
                      }, child: const Icon(Icons.add))
                ],
              );
            }
          }

          return Column(
            children:  [
              ...(state as BodegasCreateState).bodegas.map((e) => Text(e)).toList(),
              ...[
              ListTile(
                title: TextField(
                  onChanged: (text){
                    context.read<BodegasPageCubit>().inputBodega(text);
                  },
                  decoration: const InputDecoration(
                      labelText: "Nombre de la bodega"
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        context.read<BodegasPageCubit>().changeToShow();
                      },
                      child: const Icon(Icons.clear)),
                  ElevatedButton(
                      onPressed: (){
                        //Agregar el nuevo String bodega a la base de datos
                        context.read<BodegasPageCubit>().changeToShow();
                      },
                      child: const Icon(Icons.done))
                ],
              )
              ],
            ]
          );
        },
      ),
    );
  }
}
