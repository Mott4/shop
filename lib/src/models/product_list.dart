import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/src/constants/constants.dart';
import 'package:shop/src/exceptions/http_exception.dart';
import 'package:shop/src/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = [];

  bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((prod) => prod.isFavorite!).toList();
    }
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  // Metods ====================================================================

  Future<void> loadProducts() async {
    _items.clear();
    final response = await http.get(
      Uri.parse('${Constants.products_baseUrl}.json'),
    );
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((productId, productData) {
      _items.add(Product(
        id: productId,
        name: productData['name'],
        description: productData['description'],
        price: productData['price'],
        imageUrl: productData['imageUrl'],
        isFavorite: productData['isFavorite'],
      ));
    });
    notifyListeners();
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

// Save Product ----------------------------------------------------------------
  Future<void> saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

// Remove Product --------------------------------------------------------------
  Future<void> removeProduct(Product product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      // apaga localmente
      final product = _items[index];
      _items.remove(product);
      notifyListeners();

      // manda pro servidor
      final response = await http.delete(
        Uri.parse('${Constants.products_baseUrl}/${product.id}.json'),
      );

      // teste para identificar erro ao excluir
      // o item retorna para o banco de dados e aparece na interface
      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException(
          msg: 'Não foi possível excluir o produto.',
          statusCode: response.statusCode,
        );
      }
    }
  }

// Update Product --------------------------------------------------------------
  Future<void> updateProduct(Product product) async {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      final response = await http.patch(
        Uri.parse('${Constants.products_baseUrl}/${product.id}.json'),
        body: jsonEncode(
          {
            "name": product.name,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl,
          },
        ),
      );

      _items[index] = product;
      notifyListeners();
    }
  }

// Add Product -----------------------------------------------------------------
// Conectando com o Banco de Dados FIREBASE + entendendo Future
  Future<void> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('${Constants.products_baseUrl}.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );
    // metodos assíncronos obrigatoriamente retornam uma Future

    final id = jsonDecode(response.body)['name'];
    _items.add(Product(
        id: id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite));
    notifyListeners();
  }
}
