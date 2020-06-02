import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleshopflutter/providers/products.dart';
import 'package:simpleshopflutter/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          return ProductItem(
            id: products[index].id,
            title: products[index].title,
            imageUrl: products[index].imageUrl,
          );
        });
  }
}
