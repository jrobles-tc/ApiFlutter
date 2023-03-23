import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIos( BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
          title: const Text("titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Este es el contenido de la Alerta IOS"),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ]
          ),
          actions: [

            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancelar", style: TextStyle(color: Colors.red),)
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Ok")
            )
          ],

        );
      }
    );

  }

  void displayDialogAndroid(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (contex) { 
        return AlertDialog(
          elevation: 20,
          title: const Text("titulo"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15 )),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("Este es el contenido de la Alerta Android"),
              SizedBox(height: 10),
              FlutterLogo(size: 100)
            ]
          ),
          actions: [

            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Cancelar", style: TextStyle(color: Colors.red),)
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("OK")
            )

          ],

        );
      }
      );



  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            ElevatedButton(
              child: const Padding(
                padding:  EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                child:  Text("Mostrar alerta Android", style: TextStyle(fontSize: 16)),
              ),

              onPressed: () => displayDialogAndroid(context)
              
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Padding(
                padding:  EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                child:  Text("Mostrar alerta IOS", style: TextStyle(fontSize: 16)),
              ),
              onPressed: () => displayDialogIos(context)
            )
          ]
        ), 
        
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context)
      ),
    );
  }
}