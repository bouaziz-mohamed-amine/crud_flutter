
import 'dart:io';

import 'package:crud_flutter/controller/new_product_controller.dart';
import 'package:crud_flutter/controller/productscontroller.dart';
import 'package:crud_flutter/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class NewProduct extends StatelessWidget{



  final NewProductController c = Get.put(NewProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: c.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    maxLines: 2,
                    controller: c.productTitleController,
                    decoration: const InputDecoration(
                      hintText: 'Product title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: c.productDescriptionController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Product Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'description is required';
                      }
                      return null;
                    } ,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: c.productPriceController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,

                    ),
                    decoration: const InputDecoration(
                      hintText: 'Product Price',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'price is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(()=>SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: c.selectedValue.value,
                      //icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.grey),
                      underline: Container(
                        height: 2,
                        color: Colors.teal,
                      ),
                      onChanged: (value){
                        if(value=="1"){
                          c.onChange();
                        }else{
                          c.onChanged(value.toString());
                          c.onChangeFalse();
                        }
                      },
                      items: c.categories.value.map((document) {
                        return DropdownMenuItem<int>(
                          value: document.id,
                          child: Text( document.title.toString()),
                        );
                      }).toList(),
                    ),
                  ),),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectImage(),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: ()async{
                          c.add();
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomLeft: Radius.circular(20)),
                      ),
                      child: const Text('Add Product',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(height: 32,),
                  SizedBox(
                                      width: double.infinity,
                                      child: Obx(()=>( c.isError.value ) ? Text('Error Slecting ' , style: TextStyle(color: Colors.red),) : Container())
                                    ),
                ],
              )
          ),
        ),
      ),
    );
  }

 Widget _selectImage() {
    return Container(
      child: Obx(()=> c.selectedImageSource.value?
      Column(
        children: [
          RaisedButton(
              child: Text("camera"),
              onPressed:(){
                c.getImage(ImageSource.camera);
              } ),
          RaisedButton(
              child: Text("Gallery"),
              onPressed:(){
                c.getImage(ImageSource.gallery);
              } ),
          Container(
            width: double.maxFinite,
            height: 300,
            child: Obx(() => c.selectedImagePath.value==''?
            Text("no image"):Image(
                fit: BoxFit.fitHeight,
                image: FileImage(File(c.selectedImagePath.value))
            )
            ),
          )
        ],
      ):
      RaisedButton(
          child: Text("select image"),
          onPressed: c.selectTypeImage)),
    );
 }
}

