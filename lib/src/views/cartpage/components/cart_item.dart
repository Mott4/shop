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
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cartItem.price}'),
              ),
            ),
          ),
          subtitle: Text('Total: R\$${cartItem.price * cartItem.quantity}'),
          title: Text(cartItem.name),
          trailing: Text('${cartItem.quantity}'),
        ),
      ),
    );
  }
}
