import 'package:flutter/material.dart';
import 'package:shop/src/pages/cartpage/cart_page.dart';
import 'package:shop/src/pages/detailspage/product_detail_page.dart';
import 'package:shop/src/pages/homepage/products_overview_screen.dart';
import 'package:shop/src/pages/orderpage/order_page.dart';
import 'package:shop/src/pages/product-form-page/product_form_page.dart';

class AppRoutes {
  //static const String productDetail = '/product-detail';

  // Rotas Nomeadas estáticas
  // static const String home = '/';
  static const String cartPage = '/cartPage';
  static const String cart = '/cart';
  static const String ordersPage = '/ordersPage';
  static const String productsPage = '/productsPage';

  static const String productsOverviewScreen = '/productsOverviewScreen';
  static const String productDetailPage = '/productDetailPage';

  static const String productFormPage = '/productFormPage';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.productsOverviewScreen: (context) => const ProductsOverviewScreen(),
  AppRoutes.productDetailPage: (context) => const ProductDetailPage(),
  AppRoutes.cartPage: (context) => const CartPage(),
  AppRoutes.ordersPage: (context) => const OrdersPage(),
  AppRoutes.productFormPage: (context) => const ProductFormPage(),
};
