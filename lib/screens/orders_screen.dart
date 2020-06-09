import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleshopflutter/providers/orders.dart' show Orders;
import 'package:simpleshopflutter/widgets/app_drawer.dart';
import '../widgets/orders_item.dart';

class OrdersScreen extends StatelessWidget {
  static final routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemCount: orderData.orders.length,itemBuilder: (ctx, index){
        return OrderItem(orderData.orders[index]);
      }),
    );
  }
}
