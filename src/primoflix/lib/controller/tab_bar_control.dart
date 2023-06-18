import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/favorite_page.dart';
import 'package:primoflix/pages/movie_page.dart';
import 'package:primoflix/pages/home_page.dart';


class Tabbar extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabBarController());

    var tabs = const [
      Tab(text:'início', icon: Icon(Icons.home_outlined)),
      Tab(text:'busca', icon: Icon(Icons.search)),
      Tab(text:'favoritos', icon: Icon(Icons.favorite_outline))
    ];

    var telas = const [
      HomePage(),
      FavoritePage(),
      MoviePage()
    ];

    var tabLength = tabs.length == telas.length ? tabs.length : 0;

    return DefaultTabController(
        length: tabLength,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Color(0xFF181818),
            child: TabBar(
              labelColor: Color(0xFFE40812),
              unselectedLabelColor: Color(0XFFF2F2F2),
              indicatorColor: Color(0XFF181818),
              tabs: tabs
            ),
          ),
          body: TabBarView(
            children: telas,
          ),
        ),
    );
  }
}

class TabBarController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 3);
    super.onInit();
  }
}