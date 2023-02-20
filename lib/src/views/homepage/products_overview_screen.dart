import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/product_list.dart';
import 'package:shop/src/views/homepage/components/product_grid.dart';
import 'package:shop/src/views/homepage/components/product_item.dart';
import 'package:shop/src/models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Minha Loja'),
        ),
      ),
      body: ProductGrid(),
    );
  }
}
