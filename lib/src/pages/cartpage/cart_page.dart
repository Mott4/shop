import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/cart.dart';
import 'package:shop/src/models/order.dart';
import 'package:shop/src/models/order_list.dart';

import 'components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text('R\$${cart.totalAmount}',
                        style: const TextStyle(color: Colors.white)),
                  ),
                  const Spacer(),
                  TextButton(
                    child: const Text(
                      'COMPRAR',
                    ),
                    onPressed: () {
                      Provider.of<OrderList>(context, listen: false)
                          .addOrder(cart);

                      cart.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemWidget(items[i]),
            ),
          ),
        ],
      ),
    );
  }
}
