import 'package:store_app_bloc/models/product_model.dart';

abstract class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsSuccess extends CategoryProductsState {
  List<ProductModel> products;
  CategoryProductsSuccess({required this.products});
}

class CategoryProductsFailure extends CategoryProductsState {}
