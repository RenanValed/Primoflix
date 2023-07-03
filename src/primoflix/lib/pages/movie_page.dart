import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/pages/detalhe_page.dart';


class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Flexible(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    hintText: "O que deseja assistir?",
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              //botão filtro
              ButtonTheme(
                  minWidth: 200.0,
                  height: 200.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black54),
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white54)),
                    child: const Icon(Icons.filter_list_rounded),
                  ))
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.amber,
                        child: Center(child: Text('$index')),
                      );
                    }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}