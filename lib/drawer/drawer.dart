import 'package:crud_flutter/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerPage extends StatelessWidget {
  final data = GetStorage();
  UserProvider userProvider =UserProvider();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
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
            //********************  login/logout ************//////////////////////////////
            (data.read("token") == null)
                //********** login  *//////////
                ? Container(
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
                  )
                //********** others methods
                : Column(
              children: [
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
                      title: Text("LOG OUT"),
                      trailing: IconButton(
                          onPressed: () async => {
                            await userProvider.logout(),
                            data.remove("token"),
                            data.remove("owner"),
                            Get.offAndToNamed('/')
                          },
                          icon: Icon(Icons.logout)),
                    ),
                  ),
                )
              ],
            )
            //*********************************************//////////////////////////////////
          ],
        ),
      ),
    );
  }
}
