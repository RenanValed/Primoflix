import 'package:flutter/material.dart';

class Header extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Icon(Icons.menu),
        Image.asset('resources/imagens/PRIMOFLIX_LOGO.png'),
        CircleAvatar(
          radius: 26,
          backgroundImage: NetworkImage(
            'https://avatars.githubusercontent.com/u/86006755?s=400&u=f9cc0927106de2d83cc1e2bd36f27e0936b8ae84&v=4',    
          ),
        ),
        
      ]
    );
  }
}

/*
child: Row(
  crossAxisAlignment: CrossAxisAlignment.baseline,
  textBaseline: TextBaseline.alphabetic,
  children: <Widget>[
    Container(
      alignment: Alignment.bottomCenter,
      width: 100,
      height: 100,
      color: Colors.teal,
      child: Text(
        'Widget 1',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      color: Colors.indigo,
      child: Text(
        'Widget 2',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
    Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      color: Colors.deepOrange,
      child: Text(
        'Widget 3',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    ),
*/