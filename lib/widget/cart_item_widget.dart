import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_shop_project/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String titre;
  final String imageUrl;
  final double prix;
  final int quantity;
 
  const CartItemWidget(this.id, this.productId, this.titre, this.imageUrl,
      this.prix, this.quantity);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProviders>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
          title: Text(titre,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text(
            "\$$prix",
            style: TextStyle(fontSize: 15),
          ),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
