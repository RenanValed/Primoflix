import 'package:get/get.dart';

class CardMovieController extends GetxController {
  final RxList favorites = [].obs;

  void toggleFavorite(String? image, int? id) {
    final Map<String, dynamic>? favorite = favorites.firstWhere((element) => element['id'] == id, orElse: () => null);

    if (favorite != null) {
      favorites.remove(favorite);
    } else {
      favorites.add({'image': image, 'id': id});
    }
  }

  bool isFavorite(int? id) {
    return favorites.any((element) => element['id'] == id);
  }
}