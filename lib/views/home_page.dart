import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome, ${user.displayName}")),
      body: Center(
        child: Text("Email: ${user.email}"),
      ),
    );
  }
}
