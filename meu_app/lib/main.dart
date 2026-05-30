import 'package:flutter/material.dart';
import 'package:meu_app/src/screens/home_screen.dart';
import 'package:meu_app/src/screens/login_screen.dart';
import 'package:meu_app/src/screens/cart_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 67, 253, 76),
        ),
      ),

      // tela inicial
      home: const HomeScreen(),

      // rotas nomeadas (recomendado pro seu projeto)
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
