import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/cubits/category_products_cubit/category_products_state.dart';
import 'package:store_app_bloc/models/product_model.dart';
import 'package:store_app_bloc/services/get_category_service.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit() : super(CategoryProductsInitial());

  void getCategoryProducts({required String categoryName}) async {
    emit(CategoryProductsLoading());
    try {
      List<ProductModel> products =
          await GetGategoryService().getCategory(categoryName: categoryName);
      emit(CategoryProductsSuccess(products: products));
    } on Exception catch (e) {
      emit(CategoryProductsFailure());
    }
  }
}
