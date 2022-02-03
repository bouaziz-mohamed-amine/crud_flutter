import 'package:crud_flutter/controller/productscontroller.dart';
import 'package:crud_flutter/models/product.dart';
import 'package:crud_flutter/new_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProducts extends StatelessWidget {

  final ProductsController controller=Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: Column(
          children:  [
            Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(top:20),
                child: ListTile(
                  title: Text("add new product"),
                  trailing: IconButton(
                      onPressed:  () => Get.to(NewProduct()) ,
                      icon: Icon(Icons.add)),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('crud'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Obx(()=>SafeArea(
          bottom: true,
          child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:  [
                        Text(controller.products[index].title.toString()),
                        Text(controller.products[index].price.toString()),
                        Text(controller.products[index].id.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              int id=controller.products[index].id;
                              Get.toNamed('/product/$id');
                            },
                            iconSize: 25,
                            color: Colors.blue,
                            icon: Icon(
                              Icons.show_chart
                            )),
                        IconButton(
                            onPressed: (){
                              int id=controller.products[index].id;
                              Get.toNamed('/editproduct/$id');
                            },
                            iconSize: 25,
                            color: Colors.green,
                            icon: Icon(
                                Icons.edit
                            )),
                        InkWell(
                          onTap: (){
                            controller.deleleProduct(controller.products[index].id);
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),
        ),)
      )
    );
  }
}




