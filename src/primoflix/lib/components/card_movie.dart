import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/detalhe_page.dart';
import '../controller/card_movie_controller.dart';

class CardMovie extends StatelessWidget {
  CardMovie({Key? key, required this.image, required this.id});

  final String? image;
  final int? id;
  final cardMovieController = Get.put(CardMovieController());

  @override
  Widget build(BuildContext context) {
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
      child: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          heroTag: null,
          hoverColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          onPressed: () => cardMovieController.toggleFavorite(image, id),
          child: Obx(() {
            final isFavorite = cardMovieController.isFavorite(id);
            return isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 36,
                  )
                : const Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                    size: 36,
                  );
          }),
        ),
      ),
    );
  }
}
