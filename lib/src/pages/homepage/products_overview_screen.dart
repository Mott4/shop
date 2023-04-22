// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/product_list.dart';
import 'package:shop/src/pages/homepage/components/app_drawer.dart';
import 'package:shop/src/pages/homepage/components/product_grid.dart';

import 'components/bagde_cart.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [Text('Minha Loja')]),
        actions: [
          // -------------------------------------------------------------------

          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext ctx) => [
              const PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),

          // -------------------------------------------------------------------
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cartPage);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => BadgeCart(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
        ],

        // ---------------------------------------------------------------------
      ),
      body: _isLoading ? const Center(child: CircularProgressIndicator()) : ProductGrid(),
      drawer: const AppDrawer(),
    );
  }
}
