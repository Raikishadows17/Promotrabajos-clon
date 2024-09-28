import 'package:flutter/material.dart';
import 'package:promotrabajos/pages/home_page.dart';
import 'package:promotrabajos/pages/registro_page.dart';
//import 'package:promotrabajosit/services/backend_service.dart';
//import 'package:auth_buttons/auth_buttons.dart';
//import 'package:promotrabajosit/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Usuario y contraseña predefinidos para la prueba
  final String emailPredefinido = 'prueba1@gmail.com';
  final String contrasenaPredefinida = 'contrasena123';

  bool isLoading = false; // Variable para controlar la carga

  void iniciarSesionConGoogle() {
    // Agrega la lógica para iniciar sesión con Google
  }

  void iniciarSesionConLinkedIn() {
    // Agrega la lógica para iniciar sesión con LinkedIn
  }

  Future<void> iniciarSesion() async {
    final email = emailController.text;
    final password = passwordController.text;

    setState(() {
      isLoading = true; // Activa la carga
    });

    //Muestra el dialogo emergente al iniciar sesion

    await Future.delayed(Duration(seconds: 5));
    //Validar el correo electronico
    if (!esCorreoElectronicoValido(email)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('El correo electrónico no es válido'),
      ));
      setState(() {
        isLoading = false; // Desactiva la carga
      });
      return;
    }

    // Verifica si el usuario y la contraseña coinciden con los predefinidos
    if (email == emailPredefinido && password == contrasenaPredefinida) {
      // Inicio de sesión exitoso, navegar a la página de inicio
      showDialog(
        context: context,
        barrierDismissible:
            false, // No permite cerrar el diálogo al tocar fuera de él
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Iniciando Sesion'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 16.0,
                ),
                Text("Por favor espere..."),
              ],
            ),
          );
        },
      );
      // Delay para simular una tarea asíncrona
      await Future.delayed(Duration(seconds: 5));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Nombre de usuario o contraseña incorrectos. Por favor, intenta nuevamente.'),
        ),
      );
    }
    setState(() {
      isLoading = false; // Desactiva la carga
    });
  }

  bool esCorreoElectronicoValido(String correoElectronico) {
    String patronValidacion = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regExp = RegExp(patronValidacion);
    return regExp.hasMatch(correoElectronico);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      // Centra todos los elementos en la pantalla
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.black), // Puedes personalizar el borde
            borderRadius: BorderRadius.circular(
                8.0), // Puedes ajustar la esquina redondeada
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 300,
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo Electronico',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                            prefixText: ' ',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.key),
                            prefixIconConstraints: BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                            prefixText: ' ',
                          ),
                          obscureText: true, // Para ocultar la contraseña
                        ),
                      ],
                    )),
                SizedBox(height: 16.0),
                Container(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          iniciarSesion();
                        },
                        child: Text('Iniciar Sesión'),
                      ),
                      SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          // Agregar una opción para "¿Olvidaste tu contraseña?" si es necesario
                        },
                        child: Text('¿Olvidaste tu contraseña?'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Agregar un enlace a la página de registro
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistroPage()));
                        },
                        child: Text('¿No tienes una cuenta? Regístrate'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Boton de inicio de sesion con Google y Link
                      SizedBox(
                        width: double.infinity, // O el ancho que desees
                        child: ElevatedButton.icon(
                          onPressed: () {
                            iniciarSesionConGoogle();
                          },
                          icon: SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset('assets/images/google_icon.png'),
                          ),
                          label: Text('Iniciar con Google'),
                        ),
                      ),

                      SizedBox(height: 16.0),

                      // Botón de inicio de sesión con LinkedIn
                      SizedBox(
                        width: double.infinity, // O el ancho que desees
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Lógica para iniciar sesión con LinkedIn
                          },
                          icon: SizedBox(
                            width: 24,
                            height: 24,
                            child:
                                Image.asset('assets/images/linkedin_icon.png'),
                          ),
                          label: Text('Iniciar con LinkedIn'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLoginButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  CustomLoginButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
