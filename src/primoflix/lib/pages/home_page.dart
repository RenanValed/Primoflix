import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  "Bem-vindo, primo David",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )
                )
              )
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
