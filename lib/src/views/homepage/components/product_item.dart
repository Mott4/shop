import 'package:flutter/material.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/views/detailspage/product_detail_page.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          // antes do titulo ---------------------------------------------------
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
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
