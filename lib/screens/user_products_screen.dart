import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleshopflutter/providers/products.dart';
import 'package:simpleshopflutter/widgets/app_drawer.dart';
import 'package:simpleshopflutter/widgets/user_product_item.dart';

import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static final routeName = "/user-products";

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (ctx, i) => UserProductItem(
            productData.items[i].title,
            productData.items[i].imageUrl,
          ),
        ),
      ),
    );
  }
}
