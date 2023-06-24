import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhePage extends StatelessWidget {
  const DetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        //title: Text(style: ),
        leading: BackButton(
          color: Color(0xFFF2F2F2),
          onPressed: () => Get.back()),
      ),
      body: Center(
        child: Text("Essa será uma página de detalhes"),
      ),
    );
  }
}