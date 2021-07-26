import 'package:flutter/material.dart';
import '../providers/order_provider.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final OrdersItem order;

  const OrderWidget({required this.order});

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("\$${widget.order.amount.toStringAsFixed(2)}"),
              subtitle: Text(
                  DateFormat("dd-MM-yyyy hh:mm").format(widget.order.dateTime)),
              trailing: IconButton(
                icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ),
            if (expanded)
              Container(
                height: MediaQuery.of(context).size.height / 5,
                child: ListView(
                    children: widget.order.productItem
                        .map((prod) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("${prod.title}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                Text("${prod.quantity}x \$${prod.price}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))
                              ],
                            ))
                        .toList()),
              )
          ],
        ),
      ),
    );
  }
}
