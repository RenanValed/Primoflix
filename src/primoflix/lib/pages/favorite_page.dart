import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/card_movie_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key, required this.cardMovieController});
  final CardMovieController cardMovieController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Obx(() {
        final favorites = cardMovieController.favorites;
        
        if (favorites.isEmpty) {
          return const Center(
            child: Text("Nenhum filme favorito."),
          );
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final favorite = favorites[index];
            final String? image = favorite['image'];

            return Container(
              width: 150,
              height: 170,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500$image'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
