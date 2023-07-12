import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/components/card_movie.dart';
import 'package:primoflix/data/MovieModel.dart';
import 'package:primoflix/data/fetchData.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../controller/infinite_scoll.dart';

class MoviePage extends StatelessWidget {
  final InfiniteScrollController controller = Get.put(InfiniteScrollController());
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextField(
                    onChanged: (query)=> searchController.updateSearchQuery(query),
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      hintText: "Pesquise aqui, meu primo",
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 200.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: const Icon(Icons.search_outlined, size: 32),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!controller.isLoading.value &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      controller.loadMoreMovies();
                      return true;
                    }
                    return false;
                  },
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 36),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: controller.movieList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.movieList.length) {
                        return CardMovie(
                          image:controller.movieList[index].assets![index].poster_path,
                          id: controller.movieList[index].assets![index].id
                        );
                      } else {
                        if (controller.movieList.isEmpty) {
                          return Container(); // Nenhum item
                        } else {
                          return buildProgressIndicator();
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SearchController extends GetxController {
  // MovieModel? movieList;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    var res = fetchDataSearch();
    
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  Future<void> fetchDataSearch() async {
    try{
      // isLoading(true);
      if (searchQuery != null){
        http.Response response = await http.get( Uri.tryParse(
          'https://api.themoviedb.org/3/search/movie?query=$searchQuery?api_key=0fffac71fbe41c4a03797e90ed24dbcb&language=pt-BR')!
      );
        // debugPrint('prev-Request');
        if (response.statusCode == 200){
          // Requisição deu certo...
          debugPrint('Request');
          return jsonDecode(response.body);
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
}