import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserState with ChangeNotifier {
  String username;
  String jobTitle;
  String profileImageUrl;

  UserState({
    required this.username,
    required this.jobTitle,
    required this.profileImageUrl,
  });

  static UserState of(BuildContext context) =>
      context.read<UserState>();

  void setUserDetails({
    required String username,
    required String jobTitle,
    required String profileImageUrl,
  }) {
    this.username = username;
    this.jobTitle = jobTitle;
    this.profileImageUrl = profileImageUrl;

    // Notifica a los oyentes (como el menú lateral) que el estado ha cambiado
    notifyListeners();
  }
}
