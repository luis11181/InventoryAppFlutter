import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_state.dart';

class ScanPageCubit extends Cubit<ScanPageState> {
  ScanPageCubit() : super(ScanPageCameraOffState());

  void codeRead(String newCode) {
    if (state is ScanPageScanning) {
      emit(ScanPageCodeScanned(newCode));
    }
  }

  void scanAgain() {
    if (state is ScanPageCodeScanned) {
      emit(ScanPageScanning());
    }
  }

  void activateCamera() {
    if (state is ScanPageCameraOffState) {
      emit(ScanPageScanning());
    }
  }

  void sendCode(BuildContext context) {
    if (state is ScanPageCodeScanned) {
      Navigator.pop(
        context,
        (state as ScanPageCodeScanned).code,
      );
    }
  }
}
