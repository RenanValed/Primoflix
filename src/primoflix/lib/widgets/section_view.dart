import 'package:flutter/material.dart';
import 'package:primoflix/components/card_movie.dart';

class SectionView extends StatefulWidget {
  SectionView({super.key, required this.sectionTitle});

  final String sectionTitle;

  @override
  State<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Wrap(
        spacing: 24,
        runSpacing: 16,
        children: [
          Text(
            widget.sectionTitle,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CardMovie(
                    image: 'https://avatars.githubusercontent.com/u/86006755?s=400&u=f9cc0927106de2d83cc1e2bd36f27e0936b8ae84&v=4'
                  );
                }),
          )
        ],
      ),
    );
  }
}
