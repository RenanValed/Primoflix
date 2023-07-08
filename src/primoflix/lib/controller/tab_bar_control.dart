import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/favorite_page.dart';
import 'package:primoflix/pages/movie_page.dart';
import 'package:primoflix/pages/home_page.dart';
import 'package:primoflix/components/header.dart';



class Tabbar extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(TabBarController());

    var tabs = const [
      Tab(text:'início', height: 70,icon: Icon(Icons.home_outlined, size: 35,)),
      Tab(text:'busca', height: 70, icon: Icon(Icons.search, size: 35)),
      Tab(text:'favoritos', height: 70, icon: Icon(Icons.favorite_outline, size: 35))
    ];

    var telas = [
      const HomePage(),
      MoviePage(),
      const FavoritePage()
    ];

    var tabLength = tabs.length == telas.length ? tabs.length : 0;

    return DefaultTabController(
      length: tabLength,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Color.fromARGB(255, 18, 18, 18),
          title: Header(),
        ),
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