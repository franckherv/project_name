import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_shop_project/providers/order_provider.dart';
import '../widget/cart_item_widget.dart';
import '../providers/cart_provider.dart';

class CartScreens extends StatelessWidget {
  static const routeName = "/orders-screen";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProviders>(context);
    final orders = Provider.of<OrdersProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Panier"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("TOTAL",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  FittedBox(
                    child: Chip(
                        label: Text("\$${cart.totalArticlePrice.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        backgroundColor: Colors.red),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        orders.addOrders(cart.cartItems.values.toList(),
                            cart.totalArticlePrice);
                        cart.delete();
                      },
                      child: Text("Commander",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.cartItems.length,
                  itemBuilder: (cxt, i) => CartItemWidget(
                      cart.cartItems.values.toList()[i].id,
                      cart.cartItems.keys.toList()[i],
                      cart.cartItems.values.toList()[i].title,
                      cart.cartItems.values.toList()[i].image,
                      cart.cartItems.values.toList()[i].price,
                      cart.cartItems.values.toList()[i].quantity))),
        ],
      ),
    );
  }
}
