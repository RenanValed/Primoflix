import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:primoflix/data/MovieModel.dart';

class InfiniteScrollController extends GetxController {
  final itemsPerPage = 18;
  var movieList = <MovieModel>[].obs;
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
        final results = jsonData['results'];
        movieList.addAll(results);
        currentPage++;
      }
    } catch (e) {
      // Handle error
      debugPrint('Error: $e');
    }

    isLoading.value = false;
  }

    @override
    void onInit() {
      super.onInit();
      loadMoreMovies();
    }
}
