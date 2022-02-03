import 'package:crud_flutter/controller/new_product_controller.dart';
import 'package:crud_flutter/controller/productscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                ],
              )
          ),
        ),
      ),
    );
  }
}

