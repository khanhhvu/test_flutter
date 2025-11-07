import 'package:test_flutter/features/auth/data/datasources/auth_remote_data.dart';
import 'package:test_flutter/features/auth/data/models/user_model.dart';

import '../entities/user_entity.dart';
import 'auth_repository.dart';

class AuthRepoImplement implements AuthRepository {
  final AuthRemoteData remoteDataSource;

  AuthRepoImplement({required this.remoteDataSource});

  @override
  Future<User?> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
