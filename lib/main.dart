import 'package:flutter/material.dart';
import 'package:promotrabajos/pages/login_page.dart';
//import 'package:promotrabajosit/services/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:promotrabajos/utils/userData.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(
        username: 'Gerardo Valente',
        jobTitle: 'Streamer de Twitch',
        profileImageUrl:
            'https://plus.unsplash.com/premium_photo-1682124752476-40db22034a58?q=80&w=580&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PromoTrabajosIT',
      home: LoginPage(),
    );
  }
}
