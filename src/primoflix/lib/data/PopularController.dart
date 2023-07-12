import 'package:get/get.dart';
import 'package:primoflix/data/MovieModel.dart';
import 'fetchData.dart';

class PopularController extends GetxController{
  var isLoading = false.obs;
  MovieModel? movieModel;

  @override
  Future<void> onInit() async{
    super.onInit();
    isLoading(true);
    var res = await fetchData('movie/popular');
    movieModel = MovieModel.fromJson(res);
    isLoading(false);
  }
}