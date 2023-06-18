import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp( MyApp());
}

class MyApp extends GetMaterialApp {
  MyApp({super.key});
  final Color transp = Color.fromARGB(14, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), // função MyHome
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}