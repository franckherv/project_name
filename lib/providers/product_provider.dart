import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProviders with ChangeNotifier {
  List<Products> _items = [
    Products(
        id: 'p1',
        title: 'Basketball',
        description: 'A basketball red for the champoins',
        price: 29.99,
        imageUrl: 'images/basketball.jpeg'),
    Products(
      id: 'p2',
      title: 'Cardio Velo',
      description: 'For goog healthy use this cardio velo.',
      price: 59.99,
      imageUrl: 'images/cardioVelo.jpeg',
    ),
    Products(
      id: 'p3',
      title: 'tee_shirt',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'images/ci.jpeg',
    ),
    Products(
      id: 'p4',
      title: 'maillot',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'images/maillot.jpeg',
    ),
    Products(
      id: 'p5',
      title: 'Tenis',
      description: 'buy your tenis online its very easy.',
      price: 49.99,
      imageUrl: 'images/tenis.jpeg',
    ),
  ];

  List<Products> get getFavoriteItem {
    return _items.where((element) => element.isFavorite).toList();
  }



  List<Products> get items {
    return [..._items];
  }
}
