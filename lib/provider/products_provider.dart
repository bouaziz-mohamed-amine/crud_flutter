import 'package:crud_flutter/models/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductProvider extends GetConnect{

  final box=GetStorage();
  Future<Product> getProduct(String id) async{
    final response = await get("http://192.168.1.2/api/public/products/$id");
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      return Product.fromJson(response.body["data"]);
    }
  }
  Future<Map<String,dynamic>> getAllProducts(int page) async {
    List<Product> products = [];
    int total;
    final response = await get("http://192.168.1.2/api/public/products?page=$page");
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
    Map<String,String> headers={
      "Authorization" : "Bearer ${box.read("token")}"
    };
     final response = await delete("http://192.168.1.2/api/products/$id",headers: headers);
     if(response.hasError){
       print(response.statusCode);
     }else {
       print("done");
     }
  }
  Future<int?> addProduct(FormData form) async{
    Map<String,String> headers={
      "Authorization" : "Bearer ${box.read("token")}"
    };
    final response = await post("http://192.168.1.2/api/products",form,headers: headers);
    if(response.status.hasError){
      print(response.statusCode);
      return 404;
    } else {
      return response.statusCode;
      //return Product.fromJson(response.body);
    }
  }

  editProduct(String id,Map<String, dynamic> newproduct) async{
    Map<String,String> headers={
      "Authorization" : "Bearer ${box.read("token")}"
    };
    final response = await put("http://192.168.1.2/api/products/$id",newproduct,headers: headers);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      return Product.fromJson(response.body);
    }
  }

  Future<List<Product>> getAllProductsByName(String name) async {
    List<Product> products = [];
    final response = await get("http://192.168.1.2/api/public/products/name/$name");
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
    final response = await post("http://192.168.1.2/api/products",form);
    if(response.status.hasError){
      return Future.error(response.status);
    } else {
      print(response.body.toString());
      //return Product.fromJson(response.body);
    }
  }



}
