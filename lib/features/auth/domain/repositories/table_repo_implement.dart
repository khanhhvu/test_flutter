import '../../data/datasources/table_remote_data.dart';
import '../../data/models/table_model.dart';
import '../../domain/entities/table_entity.dart';
import '../../domain/repositories/table_repository.dart';

class TableRepoImplement implements TableRepository {
  final TableRemoteData remoteDataSource;

  TableRepoImplement({required this.remoteDataSource});

  @override
  Future<List<TableEntity>> getTables() async {
    final maps = await remoteDataSource.getTables();
    return maps.map((m) => TableModel.fromMap(m)).toList();
  }
}
