import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/components/card_movie.dart';
import 'package:primoflix/data/MovieModel.dart';
import 'package:primoflix/pages/detalhe_page.dart';

class SectionView extends StatelessWidget {
  SectionView({super.key, required this.sectionTitle, required this.movieModel});

  final String sectionTitle;
  final MovieModel? movieModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Wrap(
        spacing: 24,
        runSpacing: 16,
        children: [
          Text(
            this.sectionTitle,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: movieModel?.assets?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(DetalhePage(), 
                    arguments: { 'movie': movieModel?.assets?[index] }),
                    child: CardMovie(
                    image: movieModel?.assets?[index].poster_path
                  ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
