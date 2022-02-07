
class Empleado {

  Empleado({
  this.nombre = '',
  this.apellido = '',
  this.usuario = '',
  this.correo = '',
  });

  String nombre;
  String apellido;
  String usuario;
  String correo;

  factory Empleado.fromMap(Map<String, dynamic> map){
    return Empleado(
      nombre: map["name"],
      apellido: map["lastName"],
      correo: map["email"],
      usuario: map["user"]
    );
  }
}