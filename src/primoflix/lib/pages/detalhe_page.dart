import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/data/MovieModel.dart';
import 'package:primoflix/pages/home_page.dart';

class DetalhePage extends StatelessWidget {
  DetalhePage({super.key, required this.movie});
  
  Movie? movie;
  
  @override
  Widget build(BuildContext context) {  
    debugPrint( 'movie chegou ${movie!.title}');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        leading: BackButton(
          color: Color(0xFFF2F2F2),
          onPressed: () => Get.back()),
      ),
      body: Stack(
        children: [
          Container(
            // Redimensione a imagem definindo a largura e a altura desejadas
            width: double.infinity,
            height: 300,
            constraints: BoxConstraints.expand(height: 300, width: double.infinity),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${movie!.poster_path}',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 316, left: 24, right: 16),
                child: Padding(
                  padding: EdgeInsets.all(0) ,
                  child: Text(
                  movie!.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 16, 2),
                child: Text(
                  'Sinopse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 4, 24, 16) ,
                child: Text(
                  movie!.overview,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 16, 0, 4) ,
                child: Text(
                  'Detalhes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 4, 16, 16) ,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                      'Data de estréia:   ${movie!.release_date}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 24,
                        ),
                        Text(
                          ' ${movie!.popularity}  pessoas curtiram',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        )                        
                      ],
                    ),
                ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  } 
}