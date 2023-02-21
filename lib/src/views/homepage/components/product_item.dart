import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          // antes do titulo ---------------------------------------------------
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(product.isFavorite == false
                ? Icons.favorite
                : Icons.favorite_border),
            color: Theme.of(context).hintColor,
          ),

          // titulo ------------------------------------------------------------
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),

          // depois do titulo --------------------------------------------------
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).hintColor,
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
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}
