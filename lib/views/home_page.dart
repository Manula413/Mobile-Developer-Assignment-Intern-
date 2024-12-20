import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${user.displayName}"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo("Email", user.email),
            SizedBox(height: 16),
            _buildUserInfo("Employee Code", user.employeeCode),
            SizedBox(height: 16),
            _buildUserInfo("Company Code", user.companyCode),
            SizedBox(height: 16),
            _buildUserInfo("User Code", user.userCode),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
