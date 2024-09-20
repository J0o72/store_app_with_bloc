import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_bloc/cubits/categories_cubit/categories_state.dart';
import 'package:store_app_bloc/services/all_categories_service.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void getAllCategories() async {
    emit(CategoriesLoading());
    try {
      List<dynamic> categoriesNames =
          await AllCategoriesService().getAllCategories();
      emit(CategoriesSuccess(categoriesNames: categoriesNames));
    } on Exception catch (e) {
      emit(CategoriesFailure());
    }
  }
}
