import 'package:flutter/material.dart';
import 'package:primoflix/components/header.dart';
import 'package:primoflix/widgets/relevant_movie_list_view.dart';
import 'package:primoflix/widgets/section_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1, 
        backgroundColor: Color.fromARGB(255, 18, 18, 18), 
        title: Header(),
      ),
      backgroundColor:const Color.fromARGB(255, 18, 18, 18),
      body: SingleChildScrollView(
        child: Column(children: [
          RelevantMoviesListView(), 
          SectionView(sectionTitle: "Continue de onde parou"),
          SectionView(sectionTitle: "Categorias"),
          SectionView(sectionTitle: "Populares"),
        ]),
      )
    );
  }
}
