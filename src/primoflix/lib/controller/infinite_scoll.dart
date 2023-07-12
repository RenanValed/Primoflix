import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:primoflix/data/MovieModel.dart';
import 'package:primoflix/data/fetchData.dart';

class InfiniteScrollController extends GetxController {
  final itemsPerPage = 18;
  var searchQuery = ''.obs;
  var movieList = <Movie>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;

  Future<void> loadMoreMovies() async {
    isLoading.value = true;

    final apiKey = '0fffac71fbe41c4a03797e90ed24dbcb';
    final apiUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&page=$currentPage';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final results = MovieModel.fromJson(jsonData);
        movieList.assignAll(results.assets!);
        currentPage++;
      }
    } catch (e) {
      // Handle error
      debugPrint('Error: $e');
    }

    isLoading.value = false;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  Future<void> fetchDataSearch() async {
    try{
      // isLoading(true);
      if (searchQuery != null){
        http.Response response = await http.get( Uri.tryParse(
            'https://api.themoviedb.org/3/search/movie?query=$searchQuery&api_key=0fffac71fbe41c4a03797e90ed24dbcb&language=pt-BR')!
        );
        // debugPrint('prev-Request');
        if (response.statusCode == 200){
          // Requisição deu certo...
          debugPrint('Request');
          var res = jsonDecode(response.body);
          var items = MovieModel.fromJson(res);
          movieList.assignAll(items.assets!);
        } else {
          throw Exception('Error fetching data');
        }
      } else {
        throw Exception(fetchData('movie/popular'));
      }
    } catch(e){
      throw Exception('Error while getting data: $e');
    }
  }

    @override
    void onInit() {
      super.onInit();
      loadMoreMovies();
    }
}
