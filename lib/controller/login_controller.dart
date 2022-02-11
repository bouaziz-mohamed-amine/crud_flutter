import 'package:crud_flutter/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  var obscurePassword=true.obs;
  UserProvider userProvider =UserProvider();

  void login() async {
      int? res= await userProvider.login(userEmailController.text,userPasswordController.text);
      if(res==200){
        Get.toNamed("/");
      }else {
        Get.toNamed("/categories");
      }
    //print(userEmailController.text.toString()+"-"+userPasswordController.text);
  }

  void changeObscurePassword() {
    obscurePassword.value=  obscurePassword.value? false:true;
  }




}