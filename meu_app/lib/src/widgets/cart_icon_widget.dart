import 'package:flutter/material.dart';
import 'package:meu_app/src/services/cart_service.dart';
import 'package:meu_app/src/screens/cart_screen.dart';

class CartIconWidget extends StatelessWidget {
  const CartIconWidget({super.key, required this.cartService});

  final CartService cartService;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cartService,
      builder: (context, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
            ),

            if (cartService.quantidadeItens > 0)
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${cartService.quantidadeItens}',
                    style: const TextStyle(
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
    );
  }
}
