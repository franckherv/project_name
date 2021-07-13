import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/order_widget.dart';
import '../widget/appDrawer.dart';
import '../providers/order_provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orders";
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Vos commandes"),
      ),
      drawer: DrawerWidget(),
      body: ListView.builder(
          itemCount: ordersData.orders.length,
          itemBuilder: (context, i) => OrderWidget(
            order: ordersData.orders[i],
          )),
    );
  }
}
