import 'package:crud_flutter/controller/product_controller.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductProfile extends StatelessWidget {

  final ProductController c=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product"),
      ),
      body: Obx(()=>Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("id :"+c.product.value.id.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("title :"+c.product.value.title.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("price :"+c.product.value.price.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("description:"+c.product.value.description.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      )),
    );
  }
}
