import 'package:crud_flutter/provider/products_provider.dart';
import 'package:get/get.dart';
class ProductsController extends GetxController{

  ProductProvider productProvider = ProductProvider();
  var products = [].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchAllProducts();
    print(products.length);
    super.onInit();
  }

  Future<void> fetchAllProducts() async {
    products.value= await productProvider.getAllProducts();
    print(products.length);
  }

  Future<void> deleleProduct(int id)async {
    await productProvider.deleteProduct(id);
    products.value= await productProvider.getAllProducts();

  }
}