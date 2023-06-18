import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp( MyApp());
}

class MyApp extends GetMaterialApp {
  MyApp({super.key});
  final Color transp = Color.fromARGB(14, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(), // função MyHome
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final String apiKey = '0fffac71fbe41c4a03797e90ed24dbcb';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZmZmYWM3MWZiZTQxYzRhMDM3OTdlOTBlZDI0ZGJjYiIsInN1YiI6IjY0ODc1MWUxZDJiMjA5MDBjYTIwYWRjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7d4aLB6X6OhGtzRp2qgT3EXvaikhNGYs0HAxiGEyYi4';
  // URL: https://api.themoviedb.org/3/movie/550?api_key=

  Future<void> loadApi() async {
    var apiUri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path:'/3/movie/550?api_key=$apiKey',
    );

    http.read(apiUri).then((jsonString){
      var responseJson = jsonDecode(jsonString);

      if(responseJson){
        debugPrint('Deu bom');
      }
      debugPrint('deu ruimmmmmmmmm');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(14, 0, 0, 0),
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/86006755?s=400&u=f9cc0927106de2d83cc1e2bd36f27e0936b8ae84&v=4'    
                ),
              )
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Bem-vindo, David",
                  style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )
              ))
            ),
          ],
        )
      ),
      body: Center(
        child: Text("Conteúdo do body..."),
      ),
    );
  }
}



