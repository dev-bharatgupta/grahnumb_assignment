import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grahnumb_assignment/constant.dart';
import 'package:grahnumb_assignment/screens/detailscreen.dart';
import 'package:grahnumb_assignment/screens/homescreeen.dart';
import 'package:grahnumb_assignment/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Assignemnt',
      getPages: [
        GetPage(name: homeRoute, page: () => HomeScreen()),
        GetPage(name: detailScreenRoute, page: () => DetailScreen())
      ],
   initialRoute: homeRoute,
    );
  }
}
