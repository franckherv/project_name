import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product_model.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String imageUrl;

  ProductItem(
      // this.id,
      // this.title,
      // this.price,
      // this.imageUrl,
      );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context);
    final cart = Provider.of<CartProviders>(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDeatailScreen.routeName,
            arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.asset(product.imageUrl),
          footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red),
                onPressed: () {
                  product.toggleIsfavorite();
                },
              ),
              title: Text(product.title),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.red),
                onPressed: () {
                  cart.addInCart(product.id, product.title, product.price,
                      product.imageUrl);
                },
              )),
        ),
      ),
    );
  }
}
