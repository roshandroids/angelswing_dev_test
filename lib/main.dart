import 'package:angelswing_dev_test/feature/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angelswing Dev Test',
      theme: ThemeData(
          primaryColor: const Color(0xff193968),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff193968))),
      home: const HomeScreen(),
    );
  }
}
