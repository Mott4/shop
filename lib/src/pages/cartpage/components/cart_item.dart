import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/cart_model.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  const CartItemWidget(
    this.cartItem, {
    super.key,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

showDialogMessage(context) {
  return showDialog<bool>(
    context: context,
    builder: (ctx) => (AlertDialog(
      title: const Text('Tem Certeza?'),
      content: const Text('Quer remover o item do carrinho?'),
      actions: [
        TextButton(
          child: const Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text('Sim'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    )),
  );
}

class _CartItemWidgetState extends State<CartItemWidget> {
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
      confirmDismiss: (_) {
        return showDialogMessage(context);
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(widget.cartItem.productId);
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
                  child: Text('${widget.cartItem.price * widget.cartItem.quantity}'),
                ),
              ),
            ),
            title: Text(widget.cartItem.name),
            subtitle: Text('Total: R\$${widget.cartItem.price * widget.cartItem.quantity}'),
            trailing: Text('${widget.cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}
