
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


Future<Movie> fetchMovie() async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/search/movie?query=query&include_adult=false&language=pt-BR&page=1&api_key='),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic 0fffac71fbe41c4a03797e90ed24dbcb',
    },
  );
  final responseJson = jsonDecode(response.body);

  return Movie.fromJson(responseJson);
}


class Movie {
  final bool adult;
  final int id;
  final String original_language;
  final String overview;
  final String popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final String vote_average;  
  final String vote_count; 

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