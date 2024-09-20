import 'package:store_app_bloc/helper/api_helper.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categories = await Api().get(
      url: "https://fakestoreapi.com/products/categories",
    );

    return categories;
  }
}
