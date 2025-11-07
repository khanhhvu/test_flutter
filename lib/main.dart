import 'package:flutter/material.dart';
import 'package:test_flutter/features/auth/presentation/pages/home_page.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'injection_container.dart' as di;

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {
        '/login': (_) => const LoginPage(),
        '/': (_) => const HomePage(),
      },
    );
  }
}
