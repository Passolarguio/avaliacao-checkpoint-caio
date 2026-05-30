import 'package:flutter/material.dart';
import 'package:meu_app/src/models/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({required this.produto, super.key});

  final ProductModel produto;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.all(20),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      elevation: 5,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),

            child: Image.network(
              produto.imagem,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),

            child: Text(
              produto.nome,

              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),

            child: Text(
              'R\$ ${produto.preco}',

              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
