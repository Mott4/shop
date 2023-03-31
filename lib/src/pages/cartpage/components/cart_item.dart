import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(
    this.cartItem, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        child: const Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
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
            trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}
