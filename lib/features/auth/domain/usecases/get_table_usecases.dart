import 'package:test_flutter/features/auth/domain/entities/table_entity.dart';
import 'package:test_flutter/features/auth/domain/repositories/table_repository.dart';

class GetTableUseCase {
  final TableRepository repository;

  GetTableUseCase({required this.repository});

  Future<List<TableEntity>> call() async {
    return await repository.getTables();
  }
}
