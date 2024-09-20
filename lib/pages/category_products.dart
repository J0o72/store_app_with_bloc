import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:store_app_bloc/cubits/category_products_cubit/category_products_state.dart';
import 'package:store_app_bloc/widgets/products_builder.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoryProductsSuccess) {
            return ProductsBuilder(
              products: state.products,
            );
          } else if (state is CategoryProductsFailure) {
            return const Center(child: Text("SomeThing went error"));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
