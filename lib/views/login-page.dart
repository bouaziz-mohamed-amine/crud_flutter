import 'package:crud_flutter/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class LoginPage extends StatelessWidget {

  LoginController controller= Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:  Column(
            children: [
              _form()
            ],
          ),
    ),
    );
  }

 Widget _form() {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
      margin: const EdgeInsets.only(left: 10,right: 10,top: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Form(
        key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.userEmailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email ,color: Colors.teal),
                  suffixIcon: Icon(Icons.edit,color: Colors.teal,),
                  focusColor: Colors.red,
                  labelText: "Your Email",
                  hintText: "email...",
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal,width: 2)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal,width: 2),),
                  fillColor: Colors.red
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
               Obx(()=>
                   TextFormField(
                     // The validator receives the text that the user has entered.
                     controller: controller.userPasswordController,
                     obscureText: controller.obscurePassword.value,
                     decoration: InputDecoration(
                       labelText: "Your Password",
                       hintText: "password...",
                       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal,width: 2)),
                       prefixIcon:   Icon(Icons.security,color: Colors.blue),
                       suffixIcon: IconButton(onPressed: (){
                         controller.changeObscurePassword();
                       }, icon: controller.obscurePassword.value? Icon(Icons.remove_red_eye_rounded):Icon(Icons.visibility_off)),
                       //suffixIconColor: Colors.red,

                     ),
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter some text';
                       }
                       return null;
                     },
                   ),
               ),

              const SizedBox(
                height: 30,
              ),
                  MaterialButton(
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.teal,
                      child: Text("LOGIN",style: TextStyle(color: Colors.white),),
                      splashColor: Colors.teal.shade700,
                      onPressed: (){
                        controller.login();
                      }
                  ),
            ],
          )),
    );
 }
}


