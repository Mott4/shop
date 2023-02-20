import 'package:flutter/material.dart';
import 'package:shop/src/data/dummy_data.dart';
import 'package:shop/src/models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = DummyProducts;

  //List<Product> get items => _items;
  /// o spread (...) faz o "clone" da lista de itens
  List<Product> get items => [..._items];

  // Metods ====================================================================
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
    // ^^^ notificar os interessados para quando eu adicionar novos itens para
    // eventualmente eles atualizem a tela.
  }
}
