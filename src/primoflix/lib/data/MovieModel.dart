// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class MovieModel {
  MovieModel({required this.assets});

  List<Movie>? assets;

  MovieModel.fromJson(Map<String, dynamic> json) {
    assets = List<Map<String, dynamic>>.from(json['results'])
        .map((e) => Movie.fromJson(e))
        .toList();
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['results'] = assets!.map((e) => e.toJson()).toList();

  //   return _data;
  // }
}

class Movie {
  final bool adult;
  final int id;
  final String original_language;
  final String overview;
  final double popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final num vote_average;  
  final num vote_count; 

  const Movie({
        required this.adult,
        required this.id,
        required this.original_language,
        required this.overview,
        required this.popularity,
        required this.poster_path,
        required this.release_date,
        required this.title,
        required this.vote_average,
        required this.vote_count
      });
  
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      adult: json['adult'],
      id : json['id'],
      original_language: json['original_language'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      vote_average: json['vote_average'],
      vote_count:  json['vote_count']     
    );
  }
}