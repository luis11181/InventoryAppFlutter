abstract class BodegasPageState {}

class BodegasWaitingState implements BodegasPageState {}

class BodegasInputState implements BodegasPageState {
  BodegasInputState({
    this.id = 0,
    this.nombre = '',
    this.ubicacion = '',
  });

  int id;
  String nombre;
  String ubicacion;
}