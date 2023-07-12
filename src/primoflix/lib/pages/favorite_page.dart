import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/home_page.dart';
import '../components/card_movie.dart';
import '../controller/card_movie_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key, required CardMovieController cardMovieController});

  final CardMovieController cardMovieController = Get.find<CardMovieController>();

  @override
  Widget build(BuildContext context) {
    final favorites = cardMovieController.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor:  Colors.transparent,  
      ),
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: favorites.isEmpty
          ? const Center(
              child: Text("Nenhum filme favorito.", 
              style: TextStyle(
                color: Colors.white),),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                final String? image = favorite['image'];
                final int? id = favorite['id'];

                return CardMovie(
                  image: image,
                  id: id,
                );
              },
            ),
    );
  }
}
