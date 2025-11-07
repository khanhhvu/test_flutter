import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteData {
  Future<User?> login(String email, String password);
}

class AuthRemoteDataSource implements AuthRemoteData {
  final String _mockEmail = "demo@demo.com";
  final String _mockPassword = "123456";
  final String _mockUser = "Nguyễn Văn A";

  @override
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == _mockEmail && password == _mockPassword) {
      return User(id: 'id', email: email, name: _mockUser);
    }
    return null;
  }
}
