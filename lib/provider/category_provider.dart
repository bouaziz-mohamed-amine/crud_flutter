import 'package:crud_flutter/models/category.dart';
import 'package:crud_flutter/models/product.dart';
import 'package:get/get.dart';

class CategoryProvider extends GetConnect {
  
  
  Future<List<Category>> getAllCategories()async{
    List<Category> categories=[];
    var response = await get('http://192.168.1.2/api/categories');
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
    final response = await get("http://192.168.1.2/api/products/categories/$id");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      for(int i=0;i<response.body["products"].length;i++){
          products.add(Product.fromJson(response.body["products"][i]));
      }
      return products;

    }
  }

}
