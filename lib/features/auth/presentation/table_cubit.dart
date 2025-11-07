import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/features/auth/domain/usecases/get_table_usecases.dart';

import '../domain/entities/table_entity.dart';

abstract class TableState {}

class TableInitial extends TableState {}

class TableLoading extends TableState {}

class TableLoaded extends TableState {
  final List<TableEntity> tables;

  TableLoaded(this.tables);
}

class TableError extends TableState {
  final String message;

  TableError(this.message);
}

class TableCubit extends Cubit<TableState> {
  final GetTableUseCase getTablesUseCase;

  TableCubit({required this.getTablesUseCase}) : super(TableInitial());

  Future<void> fetchTables() async {
    emit(TableLoading());
    try {
      final t = await getTablesUseCase.call();
      emit(TableLoaded(t));
    } catch (e) {
      emit(TableError('Không lấy được danh sách bàn'));
    }
  }
}
