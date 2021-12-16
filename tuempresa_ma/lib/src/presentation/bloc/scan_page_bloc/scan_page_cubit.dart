import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_state.dart';

class ScanPageCubit extends Cubit<ScanPageState> {
  ScanPageCubit() : super(ScanPageState());

  void codeRead(BuildContext context, String newCode) {
    var company = (ModalRoute.of(context)!.settings.arguments as Map)["company"]
        .toString();
    var email =
        (ModalRoute.of(context)!.settings.arguments as Map)["email"].toString();
    var name =
        (ModalRoute.of(context)!.settings.arguments as Map)["name"].toString();

    if (!state.read) {
      state.read = true;
      state.code = newCode;
      var states = {
        'company': company,
        'name': name,
        'email': email,
        'code': state.code
      };

      //TODO NO USAR PUSH SINO POP, PQ LA PANTALLA DE ESCANEO SIGUE ACTIVA AL LLEVAR CON PUSH  A LA SIGUIENTE Y SE QUEDA ESCANEANDO INFINITAMENTE EN EL BACKGROUND
      Navigator.pushNamed(
        context,
        'addProduct',
        arguments: states,
      );
      
    }
  }
  //df

  void activateCamera() {
    state.isCamActive = true;
    state.read = false;
    emit(state);
  }
}
