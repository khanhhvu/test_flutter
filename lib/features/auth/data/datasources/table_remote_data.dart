import 'dart:math';

class TableRemoteData {
  Future<List<Map<String, dynamic>>> getTables() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final random = Random();

    final statuses = ['Chờ gọi', 'Đủ món', 'Bàn trống', 'Chờ món'];

    return List.generate(9, (index) {
      final status = statuses[random.nextInt(statuses.length)];

      int baseHour = 11;
      int minute = 30 + (index % 3) * 30;
      int hour = baseHour + (minute ~/ 60);
      minute = minute % 60;
      final time =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

      return {
        'id': index + 1,
        'time': time,
        'status': status,
        'price': 100000 + random.nextInt(5) * 50000,
      };
    });
  }
}
