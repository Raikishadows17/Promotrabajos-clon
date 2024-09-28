import 'package:http/http.dart' as http;

class BackendService {
  static const String baseUrl = 'https://petstore3.swagger.io/api/v3';

  static Future<bool> registrarUsuario({
     required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    // Nuevos parámetros para la información adicional
    required String rol,
    required int anosDeExperiencia,
    required String rolDeseado,
    required List<String> skills,
  }) async {
    final url = Uri.parse('$baseUrl/registro');
    final response = await http.post(
      url,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'phone': phone,
        'rol': rol,
        'añosDeExperiencia': anosDeExperiencia,
        'rolDeseado': rolDeseado,
        'skills': skills,
        'userStatus': '1', // Esto también puede variar
      },
    );
    if (response.statusCode == 201) {
      return true; // Registro exitoso
    } else {
      return false; // Error en el registro
    }
  }

  static Future<bool> iniciarSesion({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
