import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DrawerControllerPage extends GetxController {

  final storage = GetStorage();
  var token="".obs;

  @override
   onInit() {
    // TODO: implement onInit
    token.value=storage.read("token").toString();

    print(storage.read("token"));
    super.onInit();
  }

  void changeToken() {
    token.value="null";
  }

}