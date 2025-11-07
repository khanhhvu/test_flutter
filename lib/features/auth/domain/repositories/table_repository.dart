import 'package:test_flutter/features/auth/domain/entities/table_entity.dart';

abstract class TableRepository{
  Future<List<TableEntity>> getTables();
}