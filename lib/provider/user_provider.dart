import 'package:crud_flutter/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserProvider extends GetConnect{

  final box = GetStorage();

 Future<void> login(String email,String password) async {
  Map<String,String> body={
    "client_id": "2",
    "client_secret":"MZWut06ZW4gvInPmtUq3hOG8RZHkJESZ8eE3D5vX",
    "grant_type":"password",
    "username":email,
    "scope":"*",
    "password":password
  };
   //var res = await post("http://192.168.1.2/api/users/login",body);
  var res = await post("http://192.168.1.2/oauth/token",body);
    if(res.status.hasError){
     return Future.error(res.status);
   }
   //print(res.body.toString());
   box.write("token",res.body["access_token"].toString());
   List<dynamic> roles=res.body["user"]["roles"];
   //print(roles.length.toString());
    for(int i=0;i<roles.length;i++){
     if(roles[i]["role"]=="owner") {
       box.write("owner",true);
     } else {
       box.write("owner",false);
     }
     //print(roles[i]);
   }
    //print("owner"+box.read("owner").toString());
   Get.offAndToNamed('/');
   //return User.fromJson(res.body["data"]);
 }
 Future<int?> logout() async {
    Map<String,String> headers={
      "Authorization" : "Bearer ${box.read("token")}"
    };
   var res = await get("http://192.168.1.2/api/auth/logout",headers: headers);
   if (res.status.hasError) {
     print(res.statusCode);
   }  else {
     print(res.statusCode);
   }

 }

}