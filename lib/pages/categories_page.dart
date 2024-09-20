import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/cubits/categories_cubit/categories_cubit.dart';
import 'package:store_app_bloc/cubits/categories_cubit/categories_state.dart';
import 'package:store_app_bloc/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:store_app_bloc/services/all_categories_service.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoriesSuccess) {
            return CategoriesBuilder(
              categoriesName: state.categoriesNames,
            );
          } else if (state is CategoriesFailure) {
            return const Center(child: Text("SomeThing went error"));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CategoriesBuilder extends StatelessWidget {
  CategoriesBuilder({
    super.key,
    required this.categoriesName,
  });

  List<dynamic> categoriesName;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categoriesName.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // print(categoriesName[index]);
            BlocProvider.of<CategoryProductsCubit>(context)
                .getCategoryProducts(categoryName: categoriesName[index]);
            Navigator.pushNamed(context, "CategoryProducts",
                arguments: categoriesName[index]);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Text(
              categoriesName[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
        );
      },
    );
  }
}
