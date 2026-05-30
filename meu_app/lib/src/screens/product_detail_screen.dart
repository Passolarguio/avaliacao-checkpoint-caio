import 'package:flutter/material.dart';
import 'package:meu_app/src/models/product_model.dart';
import 'package:meu_app/src/services/cart_service.dart';
import 'package:meu_app/src/screens/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel produto;

  const ProductDetailScreen({required this.produto, super.key});

  @override
  Widget build(BuildContext context) {
    final CartService cartService = CartService();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 138, 9),

        title: Text(produto.nome, style: TextStyle(color: Colors.white)),

        actions: [
          ListenableBuilder(
            listenable: cartService,

            builder: (context, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 35,
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
                        color: Colors.red,
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

          SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Image.asset(produto.imagem, height: 350, fit: BoxFit.cover),

            Padding(
              padding: EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    produto.nome,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    produto.descricao,

                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        'R\$ ${produto.preco}',

                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,

                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                        ),

                        onPressed: () {
                          cartService.adicionarProduto(produto);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Produto adicionado ao carrinho!'),
                            ),
                          );
                        },

                        child: Text(
                          'Adicionar',

                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
