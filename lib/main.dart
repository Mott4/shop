import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/order_list.dart';
import 'package:shop/src/models/product_list.dart';
import 'package:shop/src/views/detailspage/product_detail_page.dart';
import 'package:shop/src/views/homepage/products_overview_screen.dart';

import 'src/views/cartpage/cart_page.dart';
import 'src/views/orderpage/order_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          hintColor: Colors.deepOrange,
          primarySwatch: Colors.purple,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          AppRoutes.productsOverviewScreen: (ctx) => const ProductsOverviewScreen(),
          AppRoutes.productDetailPage: (ctx) => const ProductDetailPage(),
          AppRoutes.cartPage: (ctx) => const CartPage(),
          AppRoutes.ordersPage: (ctx) => const OrdersPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
