import 'package:flutter/material.dart';
import 'package:shop/src/views/cartpage/cart_page.dart';
import 'package:shop/src/views/homepage/products_overview_screen.dart';

class AppRoutes {
  //static const String productDetail = '/product-detail';

  // Rotas Nomeadas estáticas
  static const String productsOverviewScreen = '/productsOverviewScreen';
  static const String productDetailPage = '/productDetailPage';
  static const String cartPage = '/cartPage';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.productsOverviewScreen: (context) => const ProductsOverviewScreen(),
  //AppRoutes.productDetailPage: (context) => ProductDetailPage(),
  AppRoutes.cartPage: (context) => const CartPage(),
};
