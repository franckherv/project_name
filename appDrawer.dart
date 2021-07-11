import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue"),
      ),
      body: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Accueil"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/");
              },
            ),
            Divider(),
            ListTile(
              title: Text("Commande"),
              leading: Icon(Icons.shopping_bag),
              onTap: () {
                Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
