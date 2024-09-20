import 'package:store_app_bloc/helper/api_helper.dart';
import 'package:store_app_bloc/models/product_model.dart';

class GetGategoryService {
  Future<List<ProductModel>> getCategory({required String categoryName}) async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products/category/$categoryName",
    );

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}
