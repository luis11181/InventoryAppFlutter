import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_state.dart';

class ScanPageView extends StatelessWidget {
  const ScanPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva transaccion '),
      ),
      body: BlocBuilder<ScanPageCubit, ScanPageState>(
        builder: (context, state) {
          return Center(
            child: state is ScanPageScanning
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: QrCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (code) {
                        if (code != null) {
                          context.read<ScanPageCubit>().codeRead(code);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: Colors.blue,
                              width: 10.0,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  )
                : state is ScanPageCodeScanned
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Codigo Escaneado: ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Center(
                              child: Text(
                                (state).code,
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    context.read<ScanPageCubit>().scanAgain(),
                                child: Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () => context
                                    .read<ScanPageCubit>()
                                    .sendCode(context),
                                child: Text('Continuar'),
                              ),
                            ],
                          )
                        ],
                      )
                    : ElevatedButton.icon(
                        onPressed: () =>
                            context.read<ScanPageCubit>().activateCamera(),
                        icon: const Icon(Icons.camera_alt),
                        label:
                            const Text('Activar camara para escanear producto'),
                      ),
          );
        },
      ),
    );
  }
}
