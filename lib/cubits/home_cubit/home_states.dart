import 'package:store_app_bloc/models/product_model.dart';

abstract class HomeState {}

class HomeIniliat extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  List<ProductModel> products;
  HomeSuccess({required this.products});
}

class HomeFailure extends HomeState {}
