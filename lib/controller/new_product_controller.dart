import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {

  final productTitleController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ProductProvider productProvider=ProductProvider();

@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    productTitleController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
  }


  void add()async {
    if (formKey.currentState!.validate()) {
          int price= int.parse(productPriceController.text)  ;
          String desc= productDescriptionController.text;
          String title=productTitleController.text;
          Product product= Product(title: title,description:desc,price:price,image: "url");
          Map<String, dynamic> newproduct=product.toJson();
          await productProvider.addProduct(newproduct);
          Get.offAllNamed("/");

    }
  }


}