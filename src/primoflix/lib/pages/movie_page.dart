import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/infinite_scoll.dart';

class MoviePage extends StatelessWidget {
  final InfiniteScrollController controller = Get.put(InfiniteScrollController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      hintText: "O que deseja assistir?",
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
                          MaterialStateProperty.all<Color>(Colors.black54),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white54),
                    ),
                    child: Icon(Icons.filter_list_rounded),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: controller.movieList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.movieList.length) {
                        return Card(
                          child: Container(
                            color: Colors.amber,
                            child: Center(
                                child:
                                    Text('${controller.movieList[index]}')),
                          ),
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
