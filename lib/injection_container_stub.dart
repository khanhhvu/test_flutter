import 'package:test_flutter/features/auth/domain/repositories/auth_repo_implement.dart';

import 'features/auth/data/datasources/auth_remote_data.dart';
import 'features/auth/data/datasources/table_remote_data.dart';
import 'features/auth/domain/repositories/table_repo_implement.dart';
import 'features/auth/domain/usecases/get_table_usecases.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/auth_cubit.dart';
import 'features/auth/presentation/table_cubit.dart';

AuthCubit provideAuthCubit() {
  final remote = AuthRemoteDataSource();
  final repo = AuthRepoImplement(remoteDataSource: remote);
  final usecase = LoginUseCase(repo);
  return AuthCubit(loginUseCase: usecase);
}


TableCubit provideTableCubit() {
  final remote = TableRemoteData();
  final repo = TableRepoImplement(remoteDataSource: remote);
  final usecase = GetTableUseCase(repository: repo);
  return TableCubit(getTablesUseCase: usecase);
}