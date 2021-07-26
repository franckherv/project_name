import 'package:flutter/foundation.dart';

class Products with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavorite;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleIsfavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
