import 'package:flutter/material.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/pages/homepage/components/custom_list_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo, Usuário'),
            automaticallyImplyLeading: false,
          ),
          CustomListTile(
            icon: Icons.shop,
            text: 'Loja',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.productsOverviewScreen);
            },
          ),
          const Divider(),
          CustomListTile(
            icon: Icons.payment,
            text: 'Pedidos',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ordersPage);
            },
          ),
          const Divider(),
          CustomListTile(
            icon: Icons.edit,
            text: 'Gerenciar Produtos',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.productsPage);
            },
          ),
        ],
      ),
    );
  }
}
