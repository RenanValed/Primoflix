import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhePage extends StatelessWidget {
  const DetalhePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Get.back()),
      ),
      body: Center(
        child: Text("Essa será uma página de detalhes"),
      ),
    );
  }
}