import 'package:flutter/material.dart';
import 'package:meu_app/src/screens/home_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'D20 Store',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 67, 253, 76),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
