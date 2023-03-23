import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../theme/app_theme.dart';


class CustomCardType1 extends StatefulWidget {

  const CustomCardType1({
    super.key,
  });

  @override
  State<CustomCardType1> createState() => _CustomCardType1State();
}

class _CustomCardType1State extends State<CustomCardType1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.api_outlined, color: AppTheme.primary),
            title: Text("Response: ", style: TextStyle(color: AppTheme.primary, fontSize: 21)), 
            subtitle: Text("Aqui aparecera la respuesta generada por el metodo GET de la API", style: TextStyle(color: Colors.grey)),
          ),

          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                TextButton(
                  onPressed: () {}, 
                  child: const Text("Reset")
                )
              ],
            ),
          )

        ],
      )
    );
  }
}