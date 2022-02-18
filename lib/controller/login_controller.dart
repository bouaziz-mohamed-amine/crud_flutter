import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final data= GetStorage();
  var obscurePassword=true.obs;
  UserProvider userProvider =UserProvider();


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    userPasswordController.dispose();
    userEmailController.dispose();

  }



  void login() async {
    if (formKey.currentState!.validate()) {
      await userProvider.login(userEmailController.text,userPasswordController.text);
      // if(user.name != ""){
      // await data.write("name", user.name);
        //Get.offAndToNamed("/");
        //print(data.read("name").toString()+"bo3");
      }

    }
      //User  user= await userProvider.login(userEmailController.text,userPasswordController.text);
      //if(user.isNull){

      //}else {
       // Get.toNamed("/");
        //data.write("name", user.name);
        //print("name"+user.name.toString());
   //   }
    //print(userEmailController.text.toString()+"-"+userPasswordController.text);
  void changeObscurePassword() {
    obscurePassword.value=  obscurePassword.value? false:true;
  }




}