import 'package:flutter/material.dart';
import 'package:promotrabajos/pages/login_page.dart';
import 'package:promotrabajos/services/backend_service.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rolController = TextEditingController();
  TextEditingController anosDeExperienciaController = TextEditingController();
  TextEditingController rolDeseadoController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  void registrarUsuario() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final phone = phoneController.text;
    final rol = rolController.text;
    final anosDeExperiencia = int.parse(anosDeExperienciaController.text);
    final rolDeseado = rolDeseadoController.text;
    final skills =
        skillsController.text.split(',').map((s) => s.trim()).toList();

    //enviar datos al backend para el registro

    final registroExitoso = await BackendService.registrarUsuario(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
      rol: rol,
      anosDeExperiencia: anosDeExperiencia,
      rolDeseado: rolDeseado,
      skills: skills,
    );

    if (registroExitoso) {
      // Registro exitoso
      // Puedes redirigir al usuario a la página de inicio de sesión u realizar otras acciones necesarias
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      //Manejar errores de registro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error en el registro. Por favor, intenta nuevamente.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 1200,
                    child: Column(
                      children: [
                        TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                          ),
                        ),
                        TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Apellido',
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo Electrónico',
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                          ),
                          obscureText: true,
                        ),
                        TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Teléfono',
                          ),
                        ),
                        TextField(
                          controller: rolController,
                          decoration: InputDecoration(
                            labelText: 'Rol',
                          ),
                        ),
                        TextField(
                          controller: anosDeExperienciaController,
                          decoration: InputDecoration(
                            labelText: 'Años de Experiencia',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: rolDeseadoController,
                          decoration: InputDecoration(
                            labelText: 'Rol Deseado',
                          ),
                        ),
                        TextField(
                          controller: skillsController,
                          decoration: InputDecoration(
                            labelText: 'Skills (Separados por comas)',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            registrarUsuario();
                          },
                          child: Text('Registrarse'),
                        ),
                        SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('¿Ya tienes una cuenta? Inicia sesión'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
