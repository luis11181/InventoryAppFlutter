import 'package:tuempresa_ma/src/domain/Bodega.dart';

abstract class BodegasPageState {}

class BodegasWaitingState implements BodegasPageState {}

class BodegasInputState implements BodegasPageState {
  bool nuevo;
  List<Bodega> bodegas;

  BodegasInputState({
    required this.bodegas,
    this.nuevo = false
  });
}