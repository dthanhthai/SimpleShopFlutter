import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleshopflutter/providers/products.dart';
import 'package:simpleshopflutter/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;


  ProductGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavorites ? productsData.favoriteItems : productsData.items;
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
          return ChangeNotifierProvider.value(
//            key: Key(products[index].id),
            value: products[index],
            child: ProductItem(),
          );
        });
  }
}
