import 'package:flutter/material.dart';
import '../screens/user_product_screen.dart';
import '../screens/order_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Bienvenue"),
          ),
          ListTile(
            title: Text(
              "Accueil",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          Divider(),
          ListTile(
            title: Text("Commande",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.shopping_bag),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Produits",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
