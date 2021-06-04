import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleshopflutter/providers/orders.dart' show Orders;
import 'package:simpleshopflutter/widgets/app_drawer.dart';
import '../widgets/orders_item.dart';

class OrdersScreen extends StatefulWidget {
  static final routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  //Store future to property to prevent new Future be created when build func be recalled
  Future? _obtainFuture;

  Future<void> _obtainOrdersFuture() async {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _obtainFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _obtainFuture,
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (dataSnapshot.error != null) {
                return Center(child: Text("Get order got error!!"));
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                      itemCount: orderData.orders.length,
                      itemBuilder: (ctx, index) {
                        return OrderItem(orderData.orders[index]);
                      }),
                );
              }
            }
          },
        ));
  }
}
