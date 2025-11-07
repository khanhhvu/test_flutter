import 'package:get_it/get_it.dart';
import 'package:test_flutter/features/auth/domain/repositories/auth_repo_implement.dart';
import 'features/auth/data/datasources/auth_remote_data.dart';

import 'features/auth/data/datasources/table_remote_data.dart';
import 'features/auth/domain/repositories/table_repo_implement.dart';
import 'features/auth/domain/usecases/get_table_usecases.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/auth_cubit.dart';
import 'features/auth/presentation/table_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => AuthRemoteDataSource());
  sl.registerLazySingleton(() => AuthRepoImplement(remoteDataSource: sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerFactory(() => AuthCubit(loginUseCase: sl()));

  sl.registerLazySingleton(() => TableRemoteData());
  sl.registerLazySingleton(() => TableRepoImplement(remoteDataSource: sl()));
  sl.registerLazySingleton(() => GetTableUseCase(repository: sl()));
  sl.registerFactory(() => TableCubit(getTablesUseCase: sl()));
}
