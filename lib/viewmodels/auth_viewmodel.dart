import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _repository = AuthRepository();
  bool isLoading = false;

  Future<UserModel?> login(String username, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      return await _repository.login(username, password);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
