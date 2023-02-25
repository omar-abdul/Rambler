import 'package:flutter/material.dart';
import './src/screens/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brambles',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.orangeAccent,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20))),
      home: const HomePage(),
    );
  }
}
