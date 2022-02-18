import 'package:crud_flutter/models/category.dart';
import 'package:crud_flutter/models/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CategoryProvider extends GetConnect {

  final box = GetStorage();
  Future<List<Category>> getAllCategories()async{
    List<Category> categories=[];
    var response = await get('http://192.168.1.2/api/public/categories');
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      for(int i=0;i<response.body["data"].length;i++){
        categories.add(Category.fromJson(response.body["data"][i]));
    }
    return categories;
  }
    
  }

  Future<List<Product>> getProductsByCategory(String id) async {
    List<Product> products = [];
    // Map<String,String> headers={
    //   "Authorization" : "Bearer ${box.read("token")}"
    // };
    final response = await get("http://192.168.1.2/api/public/categories/products/$id");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      var data=response.body["data"]["products"];
      for(int i=0;i<data.length;i++){
          products.add(Product.fromJson(data[i]));
      }
      return products;

    }
  }

}
