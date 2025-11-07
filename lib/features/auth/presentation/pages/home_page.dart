import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/table_entity.dart';
import '../../../../injection_container_stub.dart' as di_stub;
import '../../domain/entities/user_entity.dart';
import '../table_cubit.dart';

class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 90,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 115,
                        height: 34,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Xin chào!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        'Phở Quỳnh Anh',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications_none,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Doanh thu hôm nay',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 18,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const Text(
                        '12.560.000đ ↑',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: BlocProvider<TableCubit>(
          create: (_) => di_stub.provideTableCubit()..fetchTables(),
          child: BlocBuilder<TableCubit, TableState>(
            builder: (context, state) {
              if (state is TableLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TableLoaded) {
                final tables = state.tables;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Danh sách bàn',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              color: Colors.blue.shade400,
                              onPressed: () {},
                              icon: Icon(Icons.filter_alt_outlined),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Tất cả khu vực',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.9,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                        itemCount: tables.length,
                        itemBuilder: (context, index) {
                          final t = tables[index];
                          return _TableCard(table: t);
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is TableError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.note_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _TableCard extends StatelessWidget {
  final TableEntity table;

  const _TableCard({required this.table});

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'chờ gọi':
        return Colors.red;
      case 'chờ món':
        return Colors.orange;
      case 'đủ món':
        return Colors.green;
      case 'bàn trống':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(table.status);
    final isEmpty =
        table.status.toLowerCase() == 'bàn trống';

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tên bàn
            Text(
              'Bàn ${table.id}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (!isEmpty) ...[
              const SizedBox(height: 6),
              Text(
                table.time,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                table.status,
                style: TextStyle(fontSize: 12, color: color),
              ),
            ),
            if (!isEmpty) ...[
              const SizedBox(height: 6),
              Text('${table.price}đ', style: const TextStyle(fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }
}
