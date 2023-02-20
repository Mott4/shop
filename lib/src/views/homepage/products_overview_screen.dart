import 'package:flutter/material.dart';
import 'package:shop/src/views/homepage/components/product_item.dart';
import 'package:shop/src/data/dummy_data.dart';
import 'package:shop/src/models/product.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = DummyProducts;

  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Minha Loja'),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        itemCount: loadedProducts
            .length, // dizer q quantidade de itens que ele vai renderizar
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // exibir tantos produtos por linha
          childAspectRatio:
              3 / 2, // quer dizer que ele tem um aspectRatio no tamanho de 1.5
          crossAxisSpacing: 10, // espaçamento no eixo vertical
          mainAxisSpacing: 10, // espaçamento no eixo horizontal
        ),
      ),
    );
  }
}
