import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/product.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    //listen: true,
    // se eu estiver lidando com dados que sao imutaveis, posso usar o
    // listen: false quando nao preciso refletir na interface gráfica

    // Consumer
    // Posso usar o ***Consumer*** apenas onde haverá mudança na tela

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          // antes do titulo ---------------------------------------------------
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(
                product.isFavorite! ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).hintColor,
            ),
          ),

          // titulo ------------------------------------------------------------
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),

          // depois do titulo --------------------------------------------------
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).hintColor,
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Seu produto foi adicionado com sucesso!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'DESFAZER',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                      print('desfazer');
                    },
                  ),
                ),
              );
            },
          ),
          //
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productDetailPage,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}
