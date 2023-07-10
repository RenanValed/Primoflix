import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/home_page.dart';
import 'package:primoflix/controller/tab_bar_control.dart';
import 'components/BottomNavBar.dart';

void main() {
  runApp(GetMaterialApp(home: LandingPage()));
}

class MyApp extends GetMaterialApp {
  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehavior(),
      home: const HomePage(), // função MyHome
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}