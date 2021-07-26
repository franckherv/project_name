import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/product_provider.dart';
import '../widget/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool isShow;
  ProductGrid(
    this.isShow,
  );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProviders>(context);
    
    final productData = isShow ? product.getFavoriteItem : product.items;
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
      ),
      itemCount: productData.length,
      itemBuilder: (cxt, index) => ChangeNotifierProvider.value(
          value:  productData[index],
          child: ProductItem()), 
    );
  }
}
