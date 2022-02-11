import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
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
          SizedBox(
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
                    icon: Icon(Icons.add)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text("LOGIN"),
                trailing: IconButton(
                    onPressed: () => Get.toNamed("/login"),
                    icon: Icon(Icons.add)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
