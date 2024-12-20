import '../services/api_service.dart';
import '../database/sqlite_helper.dart';
import '../models/user_model.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<UserModel> login(String username, String password) async {
    final response = await _apiService.login(username, password);

    if (response['Status_Code'] == 200) {
      final user = UserModel.fromJson(response['Response_Body'][0]);
      await SQLiteHelper.saveUser(user);
      return user;
    } else {
      throw Exception(response['Message']);
    }
  }
}
