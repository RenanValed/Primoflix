import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/data/MovieModel.dart';

class DetalhePage extends StatelessWidget {
  DetalhePage({super.key, required this.movie});
  
  Movie? movie;
  
  @override
  Widget build(BuildContext context) {  
    debugPrint( 'movie chegou ${movie!.title}');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        //title: Text(style: ),
        leading: BackButton(
          color: Color(0xFFF2F2F2),
          onPressed: () => Get.back( closeOverlays: true)),
      ),
      body: Center(
        child: Text("${movie!.title}"),
      ),
    );
  }
}

// class DetailController extends GetxController {

//   Movie? data;

//   @override
//   void onInit() {
//     super.onInit();
//     // DetailController detailController = Get.put(DetailController());
//     data = Get.arguments as Movie;
//     debugPrint('data: ${data}');
//   }
// }

