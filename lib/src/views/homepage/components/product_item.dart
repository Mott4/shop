import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/core/config/routes/routes.dart';
import 'package:shop/src/models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //listen: true,
    // se eu estiver lidando com dados que sao imutaveis, posso usar o
    // listen: false quando nao preciso refletir na interface gráfica

    // Consumer
    // Posso usar o ***Consumer*** apenas onde haverá mudança na tela

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          // antes do titulo ---------------------------------------------------
          leading: Consumer<Product>(
            child: Column(
              children: const [
                Text('Algo que nunca muda! #01'),
                Text('Algo que nunca muda! #02'),
                Text('Algo que nunca muda! #03'),
              ],
            ),
            builder: (ctx, product, _) => IconButton(
              // ^^ esse terceiro parametro _ seria um child. E esse child
              // seria algo que nunca muda.

              // Ou seja, o que vai ser modificado estaria DENTRO do ***builder***
              // E o que não fosse ser modificado, estaria dentro do ***child***

              onPressed: () {
                product.toggleFavorite();
              },
              //body: child,
              // ^^ e aqui eu passaria o restante que não mudaria. Mas no caso
              // dessa aplicação, não usaremos assim.
              icon: Icon(
                product.isFavorite! ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).hintColor,
            ),
          ),
          // ^^ NESSE CASO, com o listen = false, o Consumer terá o papel de
          // fazer o efeito do botao favoritar, nao mais precisando envolver
          // a tela inteira com o listen

          // titulo ------------------------------------------------------------
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),

          // depois do titulo --------------------------------------------------
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).hintColor,
          ),
          //
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}
