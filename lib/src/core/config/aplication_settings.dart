import 'package:flutter/material.dart';
import 'package:shop/src/core/config/routes/routes.dart' as app_routes;

class ApplicationSettings {
  static const String title = 'Shop App';

  static final Map<String, Widget Function(BuildContext)> routes =
      app_routes.routes;
}
