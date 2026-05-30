import 'package:flutter/material.dart';
import 'package:meu_app/src/models/product_model.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  CartService._internal();

  final List<ProductModel> _produtos = [];

  List<ProductModel> get produtos => _produtos;

  int get quantidadeItens => _produtos.length;

  double get valorTotal {
    double total = 0;

    for (var produto in _produtos) {
      total += double.parse(produto.preco.replaceAll(',', '.'));
    }

    return total;
  }

  void adicionarProduto(ProductModel produto) {
    _produtos.add(produto);

    notifyListeners();
  }

  void removerProduto(ProductModel produto) {
    _produtos.remove(produto);

    notifyListeners();
  }
}
