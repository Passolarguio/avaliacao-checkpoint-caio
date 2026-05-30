import 'package:meu_app/src/models/product_model.dart';

class CartItemModel {
  final ProductModel produto;

  int quantidade;

  CartItemModel({required this.produto, required this.quantidade});
}
