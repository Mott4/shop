import 'package:flutter/material.dart';
import 'package:shop/src/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(
    this.cartItem, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(cartItem.name);
  }
}
