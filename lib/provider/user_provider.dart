import 'package:crud_flutter/models/user.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect{


 Future<User> login(String email,String password) async {
  Map<String,String> body={
    "email":email,
    "password":password
  };
   var res = await post("http://192.168.1.3/api/users/login",body);
   if(res.status.hasError){
     return Future.error(res.status);
   }
   print(res.body.toString());
   return User.fromJson(res.body["data"]);

 }

}