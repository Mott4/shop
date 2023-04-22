import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shop/src/constants/constants.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/models/order.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  // Getters
  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  // Methods

  // mandando para o FIREBASE
  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();
    final response = await http.post(
      //
      Uri.parse('${Constants.orders_baseUrl}.json'),
      body: jsonEncode(
        {
          "total": cart.totalAmount,
          "date": date.toIso8601String(),
          "products": cart.items.values
              .map(
                (cartItem) => {
                  'id': cartItem.id,
                  'productId': cartItem.productId,
                  'name': cartItem.name,
                  'quantity': cartItem.quantity,
                  'price': cartItem.price,
                },
              )
              .toList(),
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        date: date,
        products: cart.items.values.toList(),
      ),
    );

    notifyListeners();
  }
}
