import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProductController extends GetxController {
  final productTitleController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ProductProvider productProvider=ProductProvider();
  var product=Product().obs;
  var id=Get.parameters['id'];


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit ();
    await getProduct(id!);
    productTitleController.text=product.value.title.toString();
    productDescriptionController.text=product.value.description.toString();
    productPriceController.text= product.value.price.toString();
  }
  Future<void> getProduct(String id) async {
    var data=await productProvider.getProduct(id) as Product ;
    product.value=data;
  }

  void edit(String id)async {
    if (formKey.currentState!.validate()) {
      int price= int.parse(productPriceController.text)  ;
      String desc= productDescriptionController.text;
      String title=productTitleController.text;
      Product product= Product(title: title,description:desc,price:price);
      Map<String, dynamic> newproduct=product.toJson();
      await productProvider.editProduct(id,newproduct);
      Get.offAllNamed("/");

    }
  }
}