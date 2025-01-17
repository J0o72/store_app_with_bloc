import 'package:store_app_bloc/helper/api_helper.dart';
import 'package:store_app_bloc/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String id,
      required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
