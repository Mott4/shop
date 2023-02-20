import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/models/product_list.dart';
import 'package:shop/src/views/homepage/components/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------------------------
    // Primeiro estou obtendo o Provider
    final provider = Provider.of<ProductList>(context);

    // Obter a lista de produtor a partir do Provider
    // Entao ele vai pegar o método getter e trazer a lista de itens
    final List<Product> loadedProducts = provider.items;
    // -------------------------------------------------------------------------
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),

      itemCount: loadedProducts.length,
      // dizer q quantidade de itens que ele vai renderizar

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // exibir tantos produtos por linha

        childAspectRatio: 3 / 2,
        // quer dizer que ele tem um aspectRatio no tamanho de 1.5

        crossAxisSpacing: 10,
        // espaçamento no eixo vertical

        mainAxisSpacing: 10,
        // espaçamento no eixo horizontal
      ),
    );
  }
}
