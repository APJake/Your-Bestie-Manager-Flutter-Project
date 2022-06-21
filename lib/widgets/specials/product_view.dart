import 'package:flutter/material.dart';
import 'package:ybc_manager/data/models/product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(product.prefix),
      Text(product.codeNo),
      Text(product.price.toString()),
      Text(product.type),
    ]);
  }
}
