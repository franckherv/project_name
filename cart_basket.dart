import 'package:flutter/material.dart';

class CartBasket extends StatelessWidget {
  final Widget child;
  final String title;

  CartBasket({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          child,
          Positioned(
            right: 1,
            top: 2,
            child: Container(
              width: 20,
              height: 20,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),
    );
  }
}
