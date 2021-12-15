import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_state.dart';

class ScanPageCubit extends Cubit<ScanPageState> {
  ScanPageCubit() : super(ScanPageState());

  void codeRead(BuildContext context, String newCode) {
    if (!state.read) {
      state.read = true;
      state.code = newCode;
      Navigator.pushNamed(
        context,
        'testpage',
        arguments: state.code,
      );
    }
  }

  void activateCamera() {
    state.isCamActive = true;
    state.read = false;
    emit(state);
  }
}
