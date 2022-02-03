import 'package:crud_flutter/models/product.dart';
import 'package:get/get.dart';

class ProductProvider extends GetConnect{


  Future<Product> getProduct(String id) async{
    final response = await get("http://192.168.1.2/api/products/$id");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      return Product.fromJson(response.body);
    }
  }
  Future<List<Product>> getAllProducts() async{

    List<Product> products=[];
    final response = await get("http://192.168.1.2/api/products");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      for(int i=0;i<response.body["data"].length;i++){
          products.add(Product.fromJson(response.body["data"][i]));
      }
      return products;
    }
  }

  Future<void> deleteProduct(int id) async {
     final response = await delete("http://192.168.1.2/api/products/$id");
     if(response.hasError){
       print("none");
     }else {
       print("done");
     }
  }
  Future<Product> addProduct(Map<String, dynamic> product) async{
    final response = await post("http://192.168.1.2/api/products",product);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      return Product.fromJson(response.body);
    }
  }

  editProduct(String id,Map<String, dynamic> newproduct) async{
    final response = await put("http://192.168.1.2/api/products/$id",newproduct);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      return Product.fromJson(response.body);
    }
  }

}
