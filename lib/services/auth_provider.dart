import 'package:flutter/material.dart';
import 'package:promotrabajos/pages/home_page.dart';
import 'package:promotrabajos/pages/login_page.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoggedIn) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
