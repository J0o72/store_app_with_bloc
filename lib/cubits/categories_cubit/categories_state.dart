abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  List<dynamic> categoriesNames;
  CategoriesSuccess({required this.categoriesNames});
}

class CategoriesFailure extends CategoriesState {}
