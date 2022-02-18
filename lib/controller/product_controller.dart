import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

  var product =Product().obs;
  ProductProvider productProvider=ProductProvider();
   var id=Get.parameters['id'];
  // silver app bar
  RxBool pinned=false.obs;
  @override
  void onInit() async {
    await getProduct(id!);
    super.onInit();
  }

  Future<void> getProduct(String id) async {
    var data=await productProvider.getProduct(id) ;
    product.value=data;
  }
  void onChangePinned() {
    pinned.value= pinned.value ? false : true;
    print(pinned.value.toString());
  }
}