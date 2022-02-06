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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  state.isCamActive
                      ? Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: QrCamera(
                              onError: (context, error) => Text(
                                error.toString(),
                                style: TextStyle(color: Colors.red),
                              ),
                              qrCodeCallback: (code) {
                                if (code != null) {
                                  context
                                      .read<ScanPageCubit>()
                                      .codeRead(context, code);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                      color: Colors.orange,
                                      width: 10.0,
                                      style: BorderStyle.solid),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                              "Nueva transaccion de adicion o venta de inventario. \n Escanea QR o Barcode.   \n \n Camera inactive")),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text(
          "cam",
          textAlign: TextAlign.center,
        ),
        onPressed: () => context.read<ScanPageCubit>().activateCamera(),
      ),
    );
  }
}
