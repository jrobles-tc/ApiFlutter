import 'package:flutter/material.dart';

import '../widgets/widgets.dart';



class SelectScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traductor Texto a Audio"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () { }, 
          )
            
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
      
            //tarjetas principales
            CardSwiper(),
      
            //slider peliculas
            MovieSlider(),
            
          ],
        ),
      )
    );
  }
}