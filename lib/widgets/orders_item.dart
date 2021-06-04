import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expaneded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expaneded ? min(widget.order.products.length * 22.0 + 110, 200) : 95,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
              ),
              trailing: IconButton(
                icon: Icon(_expaneded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expaneded = !_expaneded;
                  });
                },
              ),
            ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                height:  _expaneded ? min(widget.order.products.length * 22.0 + 20, 100) : 0,
                child: ListView.builder(
                    itemCount: widget.order.products.length,
                    itemBuilder: (ctx, index) {
                      var product = widget.order.products[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product.title!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${product.quantity}x \$${product.price}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )
                        ],
                      );
                    }),
              )
          ],
        ),
      ),
    );
  }
}
