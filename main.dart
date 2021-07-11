import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:same_shop_project/screens/order_screen.dart';
import '../providers/order_provider.dart';
import 'screens/cart_screen.dart';
import '../providers/cart_provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product_provider.dart';
import '../screens/product_home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProviders(),),
        ChangeNotifierProvider(create: (_) => CartProviders(),),
        ChangeNotifierProvider(create: (_) => OrdersProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ProductsHomeScreen(),
        routes: {
          ProductDeatailScreen.routeName :(cxt) => ProductDeatailScreen(),
          CartScreens.routeName : (cxt) => CartScreens(),
          OrdersScreen.routeName  : (cxt) => OrdersScreen(),
        },
      ),
    );
  }
}

