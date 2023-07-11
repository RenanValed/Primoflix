import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/home_page.dart';
import 'package:primoflix/controller/tab_bar_control.dart';

void main() {
  runApp(GetMaterialApp(home: Tabbar()));
}

class MyApp extends GetMaterialApp {
  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehavior(),
      home: HomePage(), // função MyHome
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}