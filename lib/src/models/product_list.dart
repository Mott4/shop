import 'package:flutter/material.dart';
import 'package:shop/src/data/dummy_data.dart';
import 'package:shop/src/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = DummyProducts;

  bool _showFavoriteOnly = false;

  //List<Product> get items => _items;
  /// o spread (...) faz o "clone" da lista de itens
  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((prod) => prod.isFavorite!).toList();
    }
    return [..._items];
  }

  // Metods ====================================================================
  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
    // ^^^ notificar os interessados para quando eu adicionar novos itens para
    // eventualmente eles atualizem a tela.
  }
}
