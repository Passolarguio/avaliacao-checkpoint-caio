import 'package:flutter/material.dart';
import 'package:meu_app/src/services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartService cartService = CartService();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 138, 9),

        title: Text('Carrinho', style: TextStyle(color: Colors.white)),
      ),

      body: ListenableBuilder(
        listenable: cartService,

        builder: (context, child) {
          if (cartService.itens.isEmpty) {
            return Center(
              child: Text(
                'Seu carrinho está vazio',

                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartService.itens.length,

                  itemBuilder: (context, index) {
                    final item = cartService.itens[index];

                    return Card(
                      color: Colors.black,
                      margin: EdgeInsets.all(10),

                      child: Padding(
                        padding: EdgeInsets.all(10),

                        child: Row(
                          children: [
                            Image.asset(
                              item.produto.imagem,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),

                            SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    item.produto.nome,

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    'R\$ ${item.produto.preco}',

                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartService.adicionarProduto(item.produto);
                                  },

                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),

                                Text(
                                  '${item.quantidade}',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    cartService.removerProduto(item.produto);
                                  },

                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Total:',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'R\$ ${cartService.valorTotal.toStringAsFixed(2)}',

                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
