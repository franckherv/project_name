import '../providers/cart_provider.dart';
import 'package:flutter/foundation.dart';

class OrdersItem {
  final String id;
  final double amount;
  final List<Cart> productItem;
  final DateTime dateTime;

  OrdersItem(
      {required this.id,
      required this.amount,
      required this.productItem,
      required this.dateTime});
}

class OrdersProvider with ChangeNotifier {
  List<OrdersItem> _orders = [];

  List<OrdersItem> get orders {
    return [..._orders];
  }

  void addOrders(List<Cart> product, double total) {
    _orders.insert(
        0,
        OrdersItem(
            id: DateTime.now().toString(),
            amount: total,
            productItem: product,
            dateTime: DateTime.now()));
  }
}
