import 'package:get/get.dart';

class UserProvider extends GetConnect{


 Future<int?> login(String email,String password) async {
  Map<String,String> body={
    "email":email,
    "password":password
  };
   var res = await post("http://192.168.1.3/api/users/login",body);
   return res.statusCode;

 }

}