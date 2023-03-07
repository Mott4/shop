import 'package:shop/src/models/cart_model.dart';

class Order {
  final String id;
  final double total;
  final DateTime date;
  final List<CartItem> products;

  Order({
    required this.id,
    required this.total,
    required this.date,
    required this.products,
  });
}
