import 'package:flutter/material.dart';
import 'package:promotrabajos/models/usuario.dart';
import 'package:promotrabajos/pages/perfil_page.dart';
import 'package:provider/provider.dart';
import 'package:promotrabajos/widgets/publicacion_item.dart';
import 'package:promotrabajos/widgets/CrearPublicacionForm.dart';
import 'package:promotrabajos/utils/userData.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PromoTrabajosIT'),
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logoit.png'),
          ),
        ),
      ),
      body: Row(
        children: [
          //Menu lateral
          Consumer<UserState>(
            builder: (context, userState, _) {
              return Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userState.profileImageUrl),
                                radius: 30,
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(userState.username),
                                  Text(userState.jobTitle),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Mi Perfil'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerfilUsuarioPage(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text('Mis Conexiones'),
                      onTap: () {
                        // Agrega aquí la lógica para mostrar la lista de conexiones
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.perm_identity),
                      title: Text('Nosotros'),
                      onTap: () {
                        // Agrega aquí la lógica para la opción 2
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.outbox),
                      title: Text('Desconectar'),
                      onTap: () {
                        // Agrega aquí la lógica para desconectar al usuario
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          // Contenido principal
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Formulario para crear una nueva publicación
                  CrearPublicacionForm(),

                  // Publicación 1
                  PublicacionItem(
                    usuario: 'Chuy Varela',
                    puesto: 'Jefe de planta de tratamiento de agua',
                    imagenPerfilUrl:
                        'https://images.unsplash.com/photo-1496449903678-68ddcb189a24?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    contenido: 'Planta de Agua uwu',
                    imagenUrl:
                        'https://images.unsplash.com/photo-1523373358159-f8b259caadc6?q=80&w=1473&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fechaPublicacion: DateTime(2023, 11, 9),
                  ),

                  // Publicación 2
                  PublicacionItem(
                    usuario: 'Ruben Islas',
                    puesto: 'Jefe de Operaciones de Turno',
                    imagenPerfilUrl:
                        'https://images.unsplash.com/photo-1613951085587-cfe5d0a6cffc?q=80&w=334&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    contenido:
                        'La atracción está fabricada en acero, del cual el 60% es reciclado',
                    imagenUrl:
                        'https://images.unsplash.com/photo-1611676568323-144ad9305246?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fechaPublicacion: DateTime(2023, 11, 1),
                  ),

                  // Puedes agregar más instancias de PublicacionItem para mostrar más publicaciones
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
