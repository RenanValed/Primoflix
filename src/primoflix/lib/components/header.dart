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
        Icon(Icons.menu, color: Color(0xFFF2F2F2),),
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