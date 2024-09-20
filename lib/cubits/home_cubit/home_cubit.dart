import 'package:store_app_bloc/cubits/home_cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/models/product_model.dart';
import 'package:store_app_bloc/services/all_products_service.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIniliat());

  void getAllProducts() async {
    emit(HomeLoading());
    try {
      List<ProductModel> products = await AllProductsService().getAllProduct();
      emit(HomeSuccess(products: products));
    } on Exception catch (e) {
      emit(HomeFailure());
    }
  }
}
