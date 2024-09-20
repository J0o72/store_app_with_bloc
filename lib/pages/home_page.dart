import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/cubits/categories_cubit/categories_cubit.dart';
import 'package:store_app_bloc/cubits/home_cubit/home_cubit.dart';
import 'package:store_app_bloc/cubits/home_cubit/home_states.dart';
import 'package:store_app_bloc/widgets/products_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Trend"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'CategoryPage');
              BlocProvider.of<CategoriesCubit>(context).getAllCategories();
            },
            icon: const Icon(Icons.category),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeSuccess) {
            return ProductsBuilder(
              products: state.products,
            );
          } else if (state is HomeFailure) {
            return const Center(child: Text("SomeThing went error"));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
