import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final double price;
  final String image;
  final int quantity;

  Cart(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.quantity});
}

class CartProviders with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  Map<String, Cart> get cartItems {
    return {..._cartItems};
  }

  double get totalArticlePrice {
    var total = 00.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void undoItem(String productID) {
    if (!_cartItems.containsKey(productID)) {
      return;
    }

    if (_cartItems[productID]!.quantity > 1) {
      _cartItems.update(
          productID,
          (isPresent) => Cart(
              id: isPresent.id,
              title: isPresent.title,
              price: isPresent.price,
              image: isPresent.image,
              quantity: isPresent.quantity - 1));
    } else {
      _cartItems.remove(productID);
    }
    notifyListeners();
  }

  void addInCart(
    String productId,
    String title,
    double price,
    String image,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (value) => Cart(
                id: value.id,
                title: value.title,
                price: value.price,
                image: value.image,
                quantity: value.quantity + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              image: image,
              quantity: 1));
    }
    notifyListeners();
  }

  void delete() {
    _cartItems = {};
    notifyListeners();
  }
}
