import 'package:meu_app/src/models/product_model.dart';

class CartItemModel {
  final ProductModel produto;

  int quantidade;

  CartItemModel({required this.produto, required this.quantidade});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      produto: ProductModel.fromJson(json['produto']),

      quantidade: json['quantidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'produto': produto.toJson(), 'quantidade': quantidade};
  }
}
