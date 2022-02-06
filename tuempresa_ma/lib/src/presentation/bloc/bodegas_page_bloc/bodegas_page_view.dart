import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

import 'bodegas_page_bloc.dart';
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

      body: BlocBuilder<BodegasPageCubit, BodegasPageState>(
        builder: (context, state) {
          return state is BodegasWaitingState
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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
