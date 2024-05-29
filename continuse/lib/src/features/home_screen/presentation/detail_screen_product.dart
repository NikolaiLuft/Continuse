import 'package:continuse_2/src/domain/product.dart';
import 'package:flutter/material.dart';

class DetailScreenProduct extends StatelessWidget {
  final Product product;
  const DetailScreenProduct(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Image"),
          Text(product.title),
          Text(product.description)
        ],
      ),
    ));
  }
}
