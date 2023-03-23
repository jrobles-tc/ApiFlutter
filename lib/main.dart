import 'package:api_flutter_app/router/app_routes.dart';
import 'package:api_flutter_app/theme/app_theme.dart';
import 'package:flutter/material.dart';



void main() => runApp(const MyApp());

final themeActual= AppTheme.lightTheme;

class MyApp extends StatelessWidget { 

  const MyApp({Key? key}) :  super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: themeActual
    );
    
  }
}