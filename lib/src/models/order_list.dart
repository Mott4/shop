import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/order.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  // Getters
  List<Order> get items {
    return [..._items];
  }

  int get itensCount {
    return _items.length;
  }

  // Methods
  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        products: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
