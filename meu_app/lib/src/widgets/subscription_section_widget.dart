import 'package:flutter/material.dart';

class SubscriptionSectionWidget extends StatefulWidget {
  const SubscriptionSectionWidget({super.key});

  @override
  State<SubscriptionSectionWidget> createState() =>
      _SubscriptionSectionWidgetState();
}

class _SubscriptionSectionWidgetState extends State<SubscriptionSectionWidget> {
  final TextEditingController emailController = TextEditingController();

  bool isEmailValid(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return regex.hasMatch(email);
  }

  void inscrever(BuildContext context) {
    final email = emailController.text.trim();

    if (email.isEmpty || !isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email inválido!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email cadastrado com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );

    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Color(0xFF8FFF24)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Inscreva-se para ganhar descontos!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              'Cadastre seu email, receba novidades e descontos imperdíveis antes de todo mundo!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Digite seu melhor endereço de email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
                ),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () => inscrever(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF780BF7),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Inscrever',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
