import 'package:crud_flutter/models/product.dart';
import 'package:get/get.dart';

class ProductProvider extends GetConnect{


  Future<Product> getProduct(String id) async{
    final response = await get("http://192.168.1.3/api/products/$id");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      return Product.fromJson(response.body);
    }
  }
  Future<Map<String,dynamic>> getAllProducts(int page) async {
    List<Product> products = [];
    int total;
    final response = await get("http://192.168.1.3/api/products?page=$page");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      total=response.body["meta"]["last_page"];
      for(int i=0;i<response.body["data"].length;i++){
          products.add(Product.fromJson(response.body["data"][i]));
      }
      return {"products":products,"total":total};
    }
  }


  Future<void> deleteProduct(int id) async {
     final response = await delete("http://192.168.1.3/api/products/$id");
     if(response.hasError){
       print("none");
     }else {
       print("done");
     }
  }
  Future<void> addProduct(FormData form) async{
    final response = await post("http://192.168.1.3/api/products",form);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      //return Product.fromJson(response.body);
    }
  }

  editProduct(String id,Map<String, dynamic> newproduct) async{
    final response = await put("http://192.168.1.3/api/products/$id",newproduct);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      return Product.fromJson(response.body);
    }
  }

  Future<List<Product>> getAllProductsByName(String name) async {
    List<Product> products = [];
    final response = await get("http://192.168.1.3/api/products/name/$name");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      for(int i=0;i<response.body["data"].length;i++){
        products.add(Product.fromJson(response.body["data"][i]));
      }
      return products;
    }
  }

  addNewProduct(FormData form) async {
    final response = await post("http://192.168.1.3/api/products",form);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      //return Product.fromJson(response.body);
    }
  }



}
