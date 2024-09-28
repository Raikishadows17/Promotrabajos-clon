import 'package:flutter/material.dart';
import 'package:promotrabajos/utils/utils.dart';

class PublicacionItem extends StatelessWidget {
  final String usuario;
  final String imagenPerfilUrl;
  final String puesto;
  final String contenido;
  final DateTime fechaPublicacion;
  final String imagenUrl; //URL de la imagen

  PublicacionItem({
    required this.usuario,
    required this.imagenPerfilUrl,
    required this.puesto,
    required this.contenido,
    required this.fechaPublicacion,
    required this.imagenUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  // Puedes agregar lógica para cargar la imagen del usuario
                  // Aquí asumo que tienes la URL de la imagen del usuario
                  backgroundImage: NetworkImage(imagenPerfilUrl),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      usuario,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      puesto,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      obtenerFormatoFecha(fechaPublicacion),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(contenido),
            if (imagenUrl.isNotEmpty)
              SizedBox(
                height: 400, // Ajusta la altura según tus necesidades
                child: Image.network(
                  imagenUrl,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    // Lógica para manejar el botón "Me gusta"
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {
                    // Lógica para manejar el botón "Comentar"
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Lógica para manejar el botón "Compartir"
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
