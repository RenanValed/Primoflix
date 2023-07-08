import 'package:get/get.dart';

class ScrollController extends GetxController {
  final itemsPerPage = 15;
  var movieList = <int>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;

  void loadMoreMovies() {
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      final newMovies = List.generate(
        itemsPerPage,
        (index) => movieList.length + index,
      );
    });

    @override
    void onInit() {
      super.onInit();
      loadMoreMovies();
    }
  }
}
