import 'package:flutter/material.dart';
import 'package:shop/src/core/config/aplication_settings.dart';
import 'package:shop/src/core/config/routes/routes.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ApplicationSettings.title,
      routes: ApplicationSettings.routes,
      initialRoute: AppRoutes.productsOverviewScreen,
    );
  }
}
