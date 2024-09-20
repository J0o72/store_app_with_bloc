import 'package:flutter/material.dart';
import 'package:store_app_bloc/models/product_model.dart';
import 'package:store_app_bloc/widgets/custom_card.dart';

class ProductsBuilder extends StatelessWidget {
  ProductsBuilder({super.key, required this.products});

  List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.none,
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 60,
      ),
      itemBuilder: (context, index) {
        return CustomCard(
          product: products[index],
        );
      },
    );
  }
}
