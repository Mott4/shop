import 'package:flutter/material.dart';
import 'package:shop/src/views/homepage/products_overview_screen.dart';

class AppRoutes {
  static const PRODUCT_DETAIL = '/product-detail';

  // Rotas Nomeadas estáticas
  static const String productsOverviewScreen = '/productsOverviewScreen';
  static const String productDetailPage = '/productDetailPage';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.productsOverviewScreen: (context) => ProductsOverviewScreen(),
  //AppRoutes.productDetailPage: (context) => ProductDetailPage(),
};
