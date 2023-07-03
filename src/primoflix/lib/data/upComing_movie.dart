// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


Future<UpcomingMovie> fetchMovie() async {
  final response = await http.get(
    Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key='),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic 0fffac71fbe41c4a03797e90ed24dbcb',
    },
  );
  final responseJson = jsonDecode(response.body);

  return UpcomingMovie.fromJson(responseJson);
}

// Estréia
class UpcomingMovie {
  final int id;
  final String poster_path;
  
  const UpcomingMovie({
        required this.id,
        required this.poster_path,
  });
  
  factory UpcomingMovie.fromJson(Map<String, dynamic> json){
    return UpcomingMovie(
      id : json['id'],
      poster_path: json['poster_path'],
    );
  }
}