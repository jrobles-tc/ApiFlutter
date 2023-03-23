import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 177, 2, 72);


  static final ThemeData lightTheme = ThemeData.light().copyWith(

        //color primario
        primaryColor: Color.fromARGB(255, 177, 2, 72),

        //appbar theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0
        ),
        //texButton theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary:  primary)
        ),
        //floating acction botton
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          elevation: 5
        ),
        //elevation button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: primary,
            shape: const StadiumBorder(),
            elevation: 0
          ),
        ),

        //scaffold theme
        //scaffoldBackgroundColor: Colors.black,

        // text theme
        // textTheme: const TextTheme(
        //   headline1: TextStyle(color: Colors.white)
        // )
        
        

    
  );

  static final ThemeData DarkTheme = ThemeData.dark().copyWith(

        //color primario
        primaryColor: Colors.indigo,

        //appbar theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
        ),

        scaffoldBackgroundColor: Colors.black
  );

}