import 'package:get/get.dart';
import 'package:primoflix/data/MovieModel.dart';
import 'fetchData.dart';

class TrendingWController extends GetxController{
  var isLoading = false.obs;
  MovieModel? movieModel;

  @override
  Future<void> onInit() async{
    super.onInit();
    isLoading(true);
    var res = await fetchData('trending/movie/week');
    movieModel = MovieModel.fromJson(res);
    isLoading(false);
  }
}