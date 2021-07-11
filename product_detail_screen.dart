import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/product_provider.dart';

class ProductDeatailScreen extends StatelessWidget {
  static const routeName = "/detail_screen";
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductProviders>(context)
        .items
        .firstWhere((element) => element.id == productID);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail")
      ),
     body: Column(
       
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.asset(product.imageUrl)),
        Text(product.title),
        Text("\$ ${product.price}")
      ],
    )
    );
  }
}
