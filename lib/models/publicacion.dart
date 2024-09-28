class Publicacion {
  final String id;
  final String usuario;
  final String imagenPerfilUrl;
  final String contenido;
  final String fecha;
  final String imagenURL;

  Publicacion({
    required this.id,
    required this.usuario,
    this.imagenPerfilUrl = '',
    required this.contenido,
    required this.fecha,
    this.imagenURL = '',
  });
}