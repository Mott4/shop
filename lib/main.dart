import 'package:flutter/material.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/views/detailspage/product_detail_page.dart';
import 'package:shop/src/views/homepage/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        hintColor: Colors.deepOrange,
        primarySwatch: Colors.purple,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
