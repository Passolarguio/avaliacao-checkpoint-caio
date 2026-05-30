import 'package:flutter/material.dart';
import 'package:meu_app/src/models/product_model.dart';
import 'package:meu_app/src/widgets/hero_section_widget.dart';
import 'package:meu_app/src/widgets/product_card_widget.dart';
import 'package:meu_app/src/widgets/subscription_section_widget.dart';
import 'package:meu_app/src/screens/cart_screen.dart';
import 'package:meu_app/src/services/cart_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartService cartService = CartService();

  final List<ProductModel> produtos = [
    ProductModel(
      nome: 'Conjunto de Dados DND Marrom de Acrílico',
      imagem: 'assets/conjunto_de_dados.png',
      preco: '20,06',
      descricao:
          'Conjunto de Dados DND Dragão Marrom 7 Peças, Dados Poliédricos de Acrílico Marmorizado com Números Prateados para D&D, TRPG e RPG de Fantasia',
    ),

    ProductModel(
      nome: 'Escudo do Mestre',
      imagem: 'assets/escudo_de_mestre.png',
      preco: '89,90',
      descricao:
          'Escudo do mestre para RPG Dungeon Masters screen - RPG (Elder Sign)',
    ),

    ProductModel(
      nome: 'Torre de Dados',
      imagem: 'assets/torre_de_dados.png',
      preco: '48,90',
      descricao:
          'Torre de Dados RPG Medieval 3D Cinza com 5 Dados Dice Tower para D&D e Jogos de Tabuleiro, Rolagem Organizada e Segura',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),

      appBar: AppBar(
        leading: Icon(Icons.menu, size: 40, color: Colors.white),
        backgroundColor: Color.fromARGB(255, 2, 138, 9),
        title: Image.asset('assets/logo_d20.png', height: 40),
        centerTitle: true,

        actions: [
          Icon(Icons.person_outline, size: 40, color: Colors.white),
          SizedBox(width: 10),
          ListenableBuilder(
            listenable: cartService,

            builder: (context, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 40,
                      color: Colors.white,
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CartScreen()),
                      );
                    },
                  ),

                  Positioned(
                    right: 0,
                    top: 0,

                    child: Container(
                      padding: EdgeInsets.all(4),

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 181, 0, 236),
                        shape: BoxShape.circle,
                      ),

                      child: Text(
                        '${cartService.quantidadeItens}',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(width: 25),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            HeroSectionWidget(),

            Text(
              'Ofertas Imperdíveis',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: produtos.length,

              itemBuilder: (context, index) {
                final produto = produtos[index];

                return ProductCardWidget(produto: produto);
              },
            ),

            SubscriptionSectionWidget(),
          ],
        ),
      ),
    );
  }
}
