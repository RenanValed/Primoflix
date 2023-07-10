import 'package:flutter/material.dart';
import 'package:primoflix/widgets/relevant_movie_list_view.dart';
import 'package:primoflix/widgets/section_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 18, 18, 18),
      body: SingleChildScrollView(
        child: Column(children: [
          RelevantMoviesListView(),
          SectionView(sectionTitle: "Tendências"),
          SectionView(sectionTitle: "O que os PRIMOS vêem"),
          SectionView(sectionTitle: "Popular"),
        ]),
      )
    );
  }
}
