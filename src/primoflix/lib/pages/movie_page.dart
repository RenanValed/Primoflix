import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/detalhe_page.dart';


class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Column(
          children: [
            Text("Página de filmes..."),
          ElevatedButton(
            child: Text("Detalhes"),
            onPressed: () => Get.to(DetalhePage()),
          )
          ],
        ) 
      ),
    );
  }
}