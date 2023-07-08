import 'package:get/get.dart';

class InfiniteScrollController extends GetxController {
  final itemsPerPage = 18;
  var movieList = <String>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;

  void loadMoreMovies() {
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      currentPage++;
      final newItems = List.generate(
        itemsPerPage,
        (index) => 'Item ${(currentPage - 2) * itemsPerPage + index}',
      );
      movieList.addAll(newItems);
      isLoading.value = false;
    });
  }

    @override
    void onInit() {
      super.onInit();
      loadMoreMovies();
    }
  }
