import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  // Getters ====================================================================
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((product, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // Metods ====================================================================
  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
            id: existingItem.id,
            productId: existingItem.productId,
            name: existingItem.name,
            quantity: existingItem.quantity + 1,
            price: existingItem.price),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
        ),
      );
      print("adicionando item ${product}");
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    print('removendo item');
    notifyListeners();
  }

  void clear() {
    _items = {};
    print('limpando itens');
    notifyListeners();
  }
}
