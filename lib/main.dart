import 'package:crud_flutter/categories.dart';
import 'package:crud_flutter/edit_product.dart';
import 'package:crud_flutter/views/list_products.dart';
import 'package:crud_flutter/views/new_product.dart';
import 'package:crud_flutter/views/product_profile.dart';
import 'package:crud_flutter/views/login-page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        unknownRoute: GetPage(name: '/notfound', page: () => ListProducts() ),
        getPages: [
          GetPage(name: '/', page: () => ListProducts()),
          GetPage(name: '/newproduct', page: () => NewProduct()),
          GetPage(name: '/product/:id', page: () => ProductProfile()),
          GetPage(name: '/editproduct/:id', page: () => EditProduct()),
          GetPage(name: '/categories', page: () => CategoriesPage()),
          GetPage(name: '/login', page: () => LoginPage()),
        ],
      )
  );
}


