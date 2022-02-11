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
        title: Text('product'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: OverflowBar(
          //alignment: Alignment.center,
          overflowAlignment: OverflowBarAlignment.end,
          children: [
            const Text('pinned'),
                Obx(() =>
                    Switch(

                      onChanged: (val) {
                        c.onChangePinned();
                      },
                      value: c.pinned.value,
                    )
                ),
          ],
        ),
      ) ,
      body: CustomScrollView(
        slivers: [

              SliverAppBar(
                floating: true,
                //pinned: true,
                //snap: true,
                //automaticallyImplyLeading: false,
                //toolbarHeight: 0,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  //title: Text("FlexibleSpaceBar"),
                  background:  Container(
                    width: double.infinity,
                    height: 300,
                    child: Obx(()=>
                        Image(
                          image: NetworkImage('http://192.168.1.3/storage/images/products/${c.product.value.image}'),
                          fit: BoxFit.fitWidth,
                        )
                    ),
                  ),
                ),
              ),
          SliverList(
            // delegate: SliverChildBuilderDelegate(
            //       (BuildContext context, int index) {
            //     return Container(
            //       color: index.isOdd ? Colors.white : Colors.grey,
            //       height: 100.0,
            //       child: Center(
            //         child: Text('$index'),
            //       ),
            //     );
            //   },
            // ),
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150,
                    child: Obx(()=>Text("id :"+c.product.value.id.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),) ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 150,
                      child: Obx(()=>Center(child: Text("title :"+c.product.value.title.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 150,
                      child:Obx(()=> Center(child: Text("price :"+c.product.value.price.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 150,
                      child:Obx(()=> Center(child: Text("description:"+c.product.value.description.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)))),
                ),
              ]
            ),

          )
        ],
      ),
    );
  }
}
