import 'package:crud_flutter/categories.dart';
import 'package:crud_flutter/edit_product.dart';
import 'package:crud_flutter/list_products.dart';
import 'package:crud_flutter/new_product.dart';
import 'package:crud_flutter/product_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/newproduct',
        unknownRoute: GetPage(name: '/notfound', page: () => ListProducts() ),
        getPages: [
          GetPage(name: '/', page: () => ListProducts()),
          GetPage(name: '/newproduct', page: () => NewProduct()),
          GetPage(name: '/product/:id', page: () => ProductProfile()),
          GetPage(name: '/editproduct/:id', page: () => EditProduct()),
          GetPage(name: '/categories', page: () => CategoriesPage()),
        ],
      )
  );
}
