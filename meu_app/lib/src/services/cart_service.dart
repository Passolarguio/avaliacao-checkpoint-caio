import 'package:flutter/material.dart';
import 'package:meu_app/src/models/cart_item_model.dart';
import 'package:meu_app/src/models/product_model.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  CartService._internal();

  final List<CartItemModel> _itens = [];

  List<CartItemModel> get itens => _itens;

  int get quantidadeItens {
    int total = 0;

    for (var item in _itens) {
      total += item.quantidade;
    }

    return total;
  }

  double get valorTotal {
    double total = 0;

    for (var item in _itens) {
      total +=
          double.parse(item.produto.preco.replaceAll(',', '.')) *
          item.quantidade;
    }

    return total;
  }

  void adicionarProduto(ProductModel produto) {
    final index = _itens.indexWhere(
      (item) => item.produto.nome == produto.nome,
    );

    if (index >= 0) {
      _itens[index].quantidade++;
    } else {
      _itens.add(CartItemModel(produto: produto, quantidade: 1));
    }

    notifyListeners();
  }

  void removerProduto(ProductModel produto) {
    final index = _itens.indexWhere(
      (item) => item.produto.nome == produto.nome,
    );

    if (index >= 0) {
      if (_itens[index].quantidade > 1) {
        _itens[index].quantidade--;
      } else {
        _itens.removeAt(index);
      }

      notifyListeners();
    }
  }
}
