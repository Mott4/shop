import 'package:flutter/material.dart';
import 'package:shop/src/pages/cartpage/cart_page.dart';
import 'package:shop/src/pages/homepage/products_overview_screen.dart';
import 'package:shop/src/pages/orderpage/order_page.dart';

class AppRoutes {
  //static const String productDetail = '/product-detail';

  // Rotas Nomeadas estáticas
  // static const String home = '/';
  static const String cartPage = '/cartPage';
  static const String cart = '/cart';
  static const String ordersPage = '/ordersPage';

  static const String productsOverviewScreen = '/productsOverviewScreen';
  static const String productDetailPage = '/productDetailPage';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.productsOverviewScreen: (context) => const ProductsOverviewScreen(),
  //AppRoutes.productDetailPage: (context) => ProductDetailPage(),
  AppRoutes.cartPage: (context) => const CartPage(),
  AppRoutes.ordersPage: (context) => const OrdersPage(),
};
