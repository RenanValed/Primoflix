import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

dynamic fetchData(String url) async{
    try{
      // isLoading(true);
      http.Response response = await http.get( Uri.tryParse(
          'https://api.themoviedb.org/3/${url}?api_key=0fffac71fbe41c4a03797e90ed24dbcb&language=pt-BR')!
      );
      // debugPrint('prev-Request');
      if (response.statusCode == 200){
        // Requisição deu certo...
        debugPrint('Request');
        var res = jsonDecode(response.body);
        return res;
      } else {
        debugPrint('Error fetching data');
      }

    } catch(e){
      debugPrint('Error while getting data: $e');
    }
  } 