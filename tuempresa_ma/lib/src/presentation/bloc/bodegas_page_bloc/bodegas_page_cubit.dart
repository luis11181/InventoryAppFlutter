import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/data/authentication.dart';
import 'package:tuempresa_ma/src/data/queriesFirestore.dart';
import 'package:tuempresa_ma/src/data/initFirebase.dart';

import 'bodegas_page_state.dart';

class BodegasPageCubit extends Cubit<BodegasPageState> {
  BodegasPageCubit() : super(BodegasWaitingState());

  void createwindow(bool value) {
    if (state is BodegasInputState) {
      (state as BodegasInputState).nuevo = value;
      emit(state);
    }
  }
}
