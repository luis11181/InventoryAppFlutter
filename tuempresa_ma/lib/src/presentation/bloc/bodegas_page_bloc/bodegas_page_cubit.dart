import 'package:flutter_bloc/flutter_bloc.dart';

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
