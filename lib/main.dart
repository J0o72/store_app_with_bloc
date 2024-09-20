import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/cubits/categories_cubit/categories_cubit.dart';
import 'package:store_app_bloc/cubits/category_products_cubit/category_products_cubit.dart';
import 'package:store_app_bloc/cubits/cubit_observer.dart';
import 'package:store_app_bloc/cubits/home_cubit/home_cubit.dart';
import 'package:store_app_bloc/pages/categories_page.dart';
import 'package:store_app_bloc/pages/category_products.dart';
import 'package:store_app_bloc/pages/home_page.dart';

void main() {
  Bloc.observer = SimpleCubitObserver();

  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryProductsCubit(),
        )
      ],
      child: MaterialApp(
        routes: {
          "CategoryPage": (context) => const CategoriesPage(),
          "CategoryProducts": (context) => const CategoryProducts(),
        },
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
