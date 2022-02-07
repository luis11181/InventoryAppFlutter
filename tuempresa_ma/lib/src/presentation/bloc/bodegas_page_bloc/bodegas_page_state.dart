abstract class BodegasPageState {}

class BodegasWaitingState implements BodegasPageState {}

class BodegasShowState implements BodegasPageState {
  List<String> bodegas;

  BodegasShowState({
    required this.bodegas,
  });
}

class BodegasCreateState implements BodegasPageState {
  List<String> bodegas;
  String nueva_bodega;

  BodegasCreateState({
    required this.bodegas,
    required this.nueva_bodega
  });
}