import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = "home";
  static final menuOptions = <MenuOption> [
    MenuOption(route: "home", name: "Home Screen", screen: const HomeScreen(), icon: Icons.home),
    MenuOption(route: "getvoices", name: "GET Voices", screen: const GetVoices(), icon: Icons.add_reaction_outlined),
    MenuOption(route: "getlanguages", name: "GET languages", screen: const AlertScreen(), icon: Icons.language_outlined),
    MenuOption(route: "postsynthesize", name: "POST text to voice", screen: const AlertScreen(), icon: Icons.graphic_eq_outlined),
    

  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){ 

    Map<String, Widget Function(BuildContext)> AppRoutes = {};

    for(final option in menuOptions) {
      AppRoutes.addAll({ option.route: (BuildContext context) => option.screen });
    }
    
    return AppRoutes;
  }

  //static Map<String, Widget Function(BuildContext)> routes = {
  //      "home"     :(BuildContext context) => const HomeScreen(),
  //      "listview1":(BuildContext context) => const Listview1Screen(),
  //      "listview2":(BuildContext context) => const Listview2Screen(),
  //      "alert"    :(BuildContext context) => const AlertScreen(),
  //      "card"     :(BuildContext context) => const CardScreen(),
  //    };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => const AlertScreen(),
    );
  }

}