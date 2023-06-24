
// ignore_for_file: non_constant_identifier_names

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


  Movie(this.adult,
        this.id,
        this.original_language,
        this.overview,
        this.popularity,
        this.poster_path,
        this.release_date,
        this.title,
        this.vote_average,
        this.vote_count
        );
}