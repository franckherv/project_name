import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/user_edit_product_screen.dart';
import '../widget/appDrawer.dart';
import '../widget/user_product_widget.dart';
import '../providers/product_provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = "/user-prduct";

  @override
  Widget build(BuildContext context) {
    final userProductData = Provider.of<ProductProviders>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Espace Administrateur"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: ListView.builder(
          itemCount: userProductData.length,
          itemBuilder: (_, i) => Column(
                children: [
                  UserProductWidget(
                    id: userProductData[i].id,
                    title: userProductData[i].title,
                    imageUrl: userProductData[i].imageUrl,
                  ),
                  Divider()
                ],
              )),
    );
  }
}
