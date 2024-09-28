import 'package:flutter/material.dart';

class CrearPublicacionForm extends StatelessWidget {
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
            Text(
              'Crear Publicación',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            // Aquí puedes agregar los campos de texto para la publicación
            TextField(
              // Configuración del campo de texto para el contenido de la publicación
              decoration: InputDecoration(
                labelText: 'Contenido de la Publicación',
              ),
            ),
            SizedBox(height: 12),
             Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para agregar multimedia
                    // Puedes abrir un cuadro de diálogo para seleccionar imágenes, vídeos, etc.
                  },
                  child: Text('Agregar Multimedia'),
                ),
                SizedBox(width: 8), // Espaciado entre los botones
                ElevatedButton(
                  onPressed: () {
                    // Lógica para enviar la publicación
                  },
                  child: Text('Publicar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}