import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

dynamic fetchData(String url) async{
    try{
      // isLoading(true);
      http.Response response = await http.get( Uri.tryParse(
          'https://api.themoviedb.org/3/${url}?api_key=0fffac71fbe41c4a03797e90ed24dbcb')!
      );
      // debugPrint('prev-Request');
      if (response.statusCode == 200){
        // Requisição deu certo...
        debugPrint('Request');
        return jsonDecode(response.body);
      } else {
        debugPrint('Error fetching data');
      }

    } catch(e){
      debugPrint('Error while getting data: $e');
    }
  } 