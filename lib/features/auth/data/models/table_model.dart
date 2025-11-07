import '../../domain/entities/table_entity.dart';

class TableModel extends TableEntity {
  TableModel({
    required int id,
    required String time,
    required String status,
    required int price,
  }) : super(id: id, time: time, status: status, price: price);

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      id: map['id'],
      time: map['time'],
      status: map['status'],
      price: map['price'],
    );
  }
}
