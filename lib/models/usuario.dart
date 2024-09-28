class Usuario {
   String id;
   String firstName;
  String lastName;
   String correoElectronico;
  String password;
    String phone;
  String rol;
  int anosDeExperiencia;
  String rolDeseado;
  List<String> skills;

  Usuario({
    required this.id,
     required this.firstName,
    required this.lastName,
    required this.correoElectronico,
    required this.password,
    required this.phone,
    required this.rol,
    required this.anosDeExperiencia,
    required this.rolDeseado,
    required this.skills,
  });
}