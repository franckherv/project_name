import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/appDrawer.dart';
import 'cart_screen.dart';
import '../providers/cart_provider.dart';
import '../widget/cart_basket.dart';
import '../widget/product_grid.dart';

enum FavoriteOption { Favorite, Products }

class ProductsHomeScreen extends StatefulWidget {
  @override
  _ProductsHomeScreenState createState() => _ProductsHomeScreenState();
}

class _ProductsHomeScreenState extends State<ProductsHomeScreen> {
  bool isFavoriteProduct = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProviders>(context);
    final cartId = cart.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("BaBiShop"),
        actions: [
          PopupMenuButton(
              onSelected: (FavoriteOption select) {
                setState(() {
                  if (select == FavoriteOption.Favorite) {
                    isFavoriteProduct = true;
                  } else {
                    isFavoriteProduct = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Favoris"),
                      value: FavoriteOption.Favorite,
                    ),
                    PopupMenuItem(
                      child: Text("Produits"),
                      value: FavoriteOption.Products,
                    ),
                  ]),
          CartBasket(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreens.routeName);
              },
            ),
            title: cartId.length.toString(),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: ProductGrid(isFavoriteProduct),
    );
  }
}
