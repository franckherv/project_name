import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_shop_project/providers/product_provider.dart';
import '../screens/user_edit_product_screen.dart';

class UserProductWidget extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProductWidget(
      {required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue[600]),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              Provider.of<ProductProviders>(context, listen:false)
                  .deleteProduct(id);
              print("delete");
            },
          ),
        ],
      ),
    );
  }
}
