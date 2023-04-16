import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/models/product_list.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.productFormPage, arguments: product);
                },
                icon: const Icon(Icons.edit),
                color: Theme.of(context).primaryColor),
            //
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Deseja excluir este produto ?'),
                        content: const Text('Ao clicar em SIM, você estará removendo o produto da sua loja.'),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                            child: const Text('Não'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                            child: const Text('Sim'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Provider.of<ProductList>(context, listen: false).removeProduct(product);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
                color: Theme.of(context).hintColor),
          ],
        ),
      ),
    );
  }
}
