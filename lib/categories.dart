import 'package:crud_flutter/controller/categories_controller.dart';
import 'package:crud_flutter/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: DrawerPage(),
        appBar: AppBar(
          title: Text('Categories'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            bottom: true,
            child: Column(
              children: [
                Obx(()=>Container(
                    decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    width: double.infinity,
                    child: DropdownButton(
                    isExpanded: true,
                    underline: Container(height: 1,color: Colors.blue,),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    value: controller.selected.value,
                    onChanged: (value){
                    controller.onChanged(value.toString());
                    },
                    items: controller.categories.value
                        .map((category) => DropdownMenuItem<int>(
                        child: Text(category.title),
                        value: category.id,
                    )).toList(),
                    ),
                    ),),
                Expanded(
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Obx(()=>ListView.builder(
                          controller: controller.scrollcontroller,
                          itemCount: controller.products.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          //color: Colors.red,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: double.maxFinite,
                                                  child: Text(
                                                    controller
                                                        .products[index].title
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                  )),
                                              Container(
                                                  width: double.maxFinite,
                                                  //color: Colors.green,
                                                  child: Text(
                                                    controller
                                                        .products[index].price
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                  )),
                                              //Text(controller.products[index].id.toString()),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        //color: Colors.amberAccent,
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
                                      )
                                    ],
                                  ),
                                ),
                              ))),
                    )),
                Obx(()=> Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.08,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.last_page.value,
                    itemBuilder:(BuildContext context, int index)=>Padding(
                      padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.01,horizontal: 10),
                      child: InkWell(
                        onTap: (){
                          controller.fetchAllProducts(index+1);
                          controller.changeCurrentPage(index+1);
                        },
                        child: Obx(()=>Container(
                          decoration: BoxDecoration(
                              color: controller.current_page.value==index+1?Colors.blue.shade400:Colors.blue.shade700,
                              border: controller.current_page.value==index+1?Border.all(width: 1,color: Colors.white):Border.all(width: 0.5,color: Colors.blue.shade500),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          width: MediaQuery.of(context).size.height*0.06,
                          child: Center(child: Text((index+1).toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),)),
                        )),
                      ),
                    ),
                  ),
                ) )
              ],
            ),
          ),
        )
    );
  }
}
