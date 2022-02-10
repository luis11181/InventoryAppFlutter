abstract class BodegasPageState {}

class BodegasWaitingState implements BodegasPageState {}

class BodegasShowState implements BodegasPageState {
  List bodegas;

  BodegasShowState({
    required this.bodegas,
  });
}

class BodegasCreateState implements BodegasPageState {
  List bodegas;
  String nueva_bodega;

  BodegasCreateState({required this.bodegas, required this.nueva_bodega});
}

// abstract class BodegasPageState {}

// class BodegasWaitingState implements BodegasPageState {}

// class BodegasShowState implements BodegasPageState {
//   List bodegas;

//   BodegasShowState({
//     required this.bodegas,
//   });
// }

// class BodegasCreateState implements BodegasPageState {
//   List bodegas;
//   String nueva_bodega;

//   BodegasCreateState({
//     required this.bodegas,
//     required this.nueva_bodega
//   });
// }