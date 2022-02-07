import 'package:crud_flutter/models/category.dart';
import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/provider/category_provider.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NewProductController extends GetxController {

  final productTitleController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ProductProvider productProvider=ProductProvider();
  CategoryProvider categoryProvider=CategoryProvider();
   var categories= [].obs;
  var isError=false.obs;
  var selectedValue=1.obs;
  var selectedImageSource = false.obs;
  var selectedImagePath=''.obs;
  var selectedImageSize=''.obs;

  void selectTypeImage() {
    selectedImageSource.value=!selectedImageSource.value;
  }

  Future<void> getImage (ImageSource imageSource) async {

    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile !=null){
      selectedImagePath.value=pickedFile.path;
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getCategories();
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    productTitleController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
  }

  Future<void> getCategories() async {
    categories.value= await categoryProvider.getAllCategories();
    print(categories.value.toString());
  }
  void add()async {
    if (formKey.currentState!.validate()) {
          int price= int.parse(productPriceController.text)  ;
          String desc= productDescriptionController.text;
          String title=productTitleController.text;
          int category_id=selectedValue.value;
          Product product= Product(title: title,description:desc,price:price,image: "url",category_id: category_id);
          Map<String, dynamic> newproduct=product.toJson();
          await productProvider.addProduct(newproduct);
          Get.offAllNamed("/");

    }
  }

   onChange() {
     isError.value=true;
  }
  onChangeFalse(){
    isError.value=false;
  }

  onChanged(String value) async {
    selectedValue.value=int.parse(value);
  }





}