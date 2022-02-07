import 'package:crud_flutter/provider/category_provider.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoriesController extends GetxController{

  ProductProvider productProvider = ProductProvider();
  CategoryProvider categoryProvider=CategoryProvider();
  var products = [].obs;
  var selected=1.obs;
  var categories=[].obs;
  var last_page=0.obs;
  var current_page=1.obs;

  var scrollcontroller = ScrollController();
  @override
  void onInit() async {
    // TODO: implement onInit
    //last_page.value=amine["meta"]["last_page"];
    await fetchAllProducts(current_page.value);
    await fetchAllCategories();
    //print(categories.value.length.toString());
    scrollcontroller.addListener(pagination);
    super.onInit();
  }

  Future<void> fetchAllProducts(int page) async {
    var data= await productProvider.getAllProducts(page);
    products.value=data["products"];
    //print(products.length);
    last_page.value=data["total"];
  }
  Future<void> fetchAllCategories() async {
    categories.value= await categoryProvider.getAllCategories();
    print(categories.value.length);
  }

  Future<void> deleleProduct(int id)async {
    await productProvider.deleteProduct(id);
    var data= await productProvider.getAllProducts(1);
    products.value=data["products"];

  }
  Future<void> onChanged(String value) async {
    selected.value=int.parse(value);
    products.value= await categoryProvider.getProductsByCategory(value);
  }


  void pagination() {
    // if (scrollController.position.pixels == scrollController.position.maxScrollExtent){
    //
    // }
    scrollcontroller.addListener(() {
      if(scrollcontroller.position.maxScrollExtent==scrollcontroller.position.pixels){
        current_page.value++ ;
        update();
      }
    });

    }

  void changeCurrentPage(int i) {
    current_page.value= i ;
  }
}