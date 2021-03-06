import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductsController extends GetxController{

  ProductProvider productProvider = ProductProvider();
  var products = [].obs;
  var selected="amine".obs;
  final productTitleController = TextEditingController();
  var product="".obs;
  var last_page=0.obs;
  var current_page=1.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchAllProducts(current_page.value);
    print(products.value.length.toString());
    super.onInit();
  }

  Future<void> fetchAllProducts(int page) async {
    var data= await productProvider.getAllProducts(page);
    products.value=data["products"];
    last_page.value=data["total"];
  }

  Future<void> deleleProduct(int id)async {
    await productProvider.deleteProduct(id);
    var data= await productProvider.getAllProducts(1);
    products.value=data["products"];

  }

  void onChanged(String value) {
    selected.value=value.toString();
  }

   Future<void> selectProducts() async{
      if(productTitleController.text!=""){
        String name=productTitleController.text;
        products.value= await productProvider.getAllProductsByName(name);
      }
  }

  void changeCurrentPage(int i) {
    current_page.value= i ;
  }
}