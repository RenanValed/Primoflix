import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:primoflix/pages/favorite_page.dart';
import 'package:primoflix/pages/movie_page.dart';
import 'package:primoflix/pages/home_page.dart';
import 'package:primoflix/components/header.dart';

import '../controller/nav_controller.dart';

class BottomNav extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, bottomPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: bottomPageController.changeTabIndex,
            currentIndex: bottomPageController.tabIndex.value,
            backgroundColor: const Color.fromARGB(255, 18, 18, 18),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: const Color(0xFFE40812),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 20,
                  ),
                ),
                label: 'Favoritos',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NavPageController bottomPageController =
        Get.put(NavPageController(), permanent: false);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, bottomPageController),
        body: Obx(
          () => IndexedStack(
            index: bottomPageController.tabIndex.value,
            children: [
              const HomePage(),
              MoviePage(),
              const FavoritePage(),
            ],
          ),
        ),
      ),
    );
  }
}
