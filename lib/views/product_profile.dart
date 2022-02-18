import 'package:crud_flutter/controller/product_controller.dart';
import 'package:crud_flutter/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductProfile extends StatelessWidget {
  final ProductController c = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('product'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: OverflowBar(
          //alignment: Alignment.center,
          overflowAlignment: OverflowBarAlignment.end,
          children: [
            const Text('pinned'),
            Obx(() => Switch(
                  onChanged: (val) {
                    c.onChangePinned();
                  },
                  value: c.pinned.value,
                )),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            //snap: true,
            //automaticallyImplyLeading: false,
            //toolbarHeight: 0,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text("FlexibleSpaceBar"),
              background: Container(
                width: double.infinity,
                height: 300,
                child: Obx(() => Image(
                      image: NetworkImage(
                          'http://192.168.1.2/storage/images/products/${c.product.value.image}'),
                      fit: BoxFit.fill,
                    )),
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

            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text(
                          c.product.value.title.toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )),
                    Obx(() => Text(
                          c.product.value.price.toString() + " DT",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() => Center(
                        child: Text(
                      c.product.value.description.toString(),
                      style: TextStyle(fontSize: 15),
                    ))),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
