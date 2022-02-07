import 'package:crud_flutter/controller/productscontroller.dart';
import 'package:crud_flutter/drawer.dart';
import 'package:crud_flutter/new_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProducts extends StatelessWidget {
  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(),
        appBar: AppBar(
          title: Text('All Products'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade300,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: controller.productTitleController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write a Product here!',
                              contentPadding: EdgeInsets.only(
                                  left: 16, top: 24, bottom: 24)),
                        ),
                      ),
                      MaterialButton(
                        elevation: 4,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        onPressed: () {
                          controller.selectProducts();
                        },
                        color: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(width: 2, color: Colors.blue)),
                        child: Text(
                          "click",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                    color: Colors.grey.shade100,
                    child: Obx(() => ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              child: Column(
                                children: [
                                  Container(
                                      //padding: EdgeInsets.symmetric(vertical: 10),
                                    height: 25,
                                      width: double.maxFinite,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only( top:8.0),
                                          child: Text(
                                            controller.products[index].title
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 15 ),
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      width: double.maxFinite,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Image(
                                        image: NetworkImage(
                                            "http://192.168.1.2/storage/images/products/1644220294polo-7-14-essence-5-cv-4-cylindre_used_01544178842.jpeg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  int id = controller
                                                      .products[index].id;
                                                  Get.toNamed('/product/$id');
                                                },
                                                iconSize: 25,
                                                color: Colors.blue,
                                                icon: const Icon(
                                                    Icons.show_chart)),
                                            IconButton(
                                                onPressed: () {
                                                  int id = controller
                                                      .products[index].id;
                                                  Get.toNamed(
                                                      '/editproduct/$id');
                                                },
                                                iconSize: 25,
                                                color: Colors.green,
                                                icon: Icon(Icons.edit)),
                                            InkWell(
                                              onTap: () {
                                                controller.deleleProduct(
                                                    controller
                                                        .products[index].id);
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                size: 25,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                              width: double.maxFinite,
                                              child: Text(
                                                controller
                                                    .products[index].price
                                                    .toString()+ " "+"DT",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              )),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))),
                )),
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.last_page.value,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          controller.fetchAllProducts(index + 1);
                          controller.changeCurrentPage(index + 1);
                        },
                        child: Obx(() => Container(
                              decoration: BoxDecoration(
                                  color: controller.current_page.value ==
                                          index + 1
                                      ? Colors.blue.shade400
                                      : Colors.blue.shade700,
                                  border:
                                      controller.current_page.value == index + 1
                                          ? Border.all(
                                              width: 1, color: Colors.white)
                                          : Border.all(
                                              width: 0.5,
                                              color: Colors.blue.shade500),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              width: MediaQuery.of(context).size.height * 0.06,
                              child: Center(
                                  child: Text(
                                (index + 1).toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
