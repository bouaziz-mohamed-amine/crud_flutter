import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class DrawerPage extends StatelessWidget {

  final data=GetStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text("add new product"),
                trailing: IconButton(
                    onPressed: () => Get.toNamed("/newproduct"),
                    icon: Icon(Icons.add)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text("all categories"),
                trailing: IconButton(
                    onPressed: () => Get.toNamed("/categories"),
                    icon: Icon(Icons.category)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          (data.read("name")==null) ?Container(
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text("LOGIN"),
                trailing: IconButton(
                    onPressed: () => Get.toNamed("/login"),
                    icon: Icon(Icons.login)),
              ),
            ),
          ):Container(
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:  ListTile(
                title: Text("LOG OUT"),
                trailing: IconButton(
                    onPressed: () => data.remove("name"),
                    icon: Icon(Icons.logout)
                ),
            ),
          ),
          )
        ],
      ),
    );
  }
}
