import 'package:flutter/material.dart';
import 'package:meu_app/src/widgets/hero_section_widget.dart';
import 'package:meu_app/src/widgets/product_card_widget.dart';
import 'package:meu_app/src/widgets/subscription_section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 40),
        title: Image.asset('assets/logo_usedev.png', height: 40),
        centerTitle: true,
        actions: [
          Icon(Icons.person_outline, size: 40),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined, size: 40),
          SizedBox(width: 25),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          crossAxisAlignment: .stretch,
          children: [
            HeroSectionWidget(),
            Text(
              'Promos Especiais',
              textAlign: .center,
              style: TextStyle(fontSize: 28, fontWeight: .bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => ProductCardWidget(
                nome: 'Produto 0$index',
                url: 'https://placehold.co/600x600.png',
                preco: '10$index,00',
              ),
            ),
            SubscriptionSectionWidget(),
          ],
        ),
      ),
    );
  }
}
