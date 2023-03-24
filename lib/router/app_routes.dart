import 'package:api_flutter_app/screens/get_languages_screen.dart';
import 'package:api_flutter_app/screens/post_synthesize_screen.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = "home";
  static final menuOptions = <MenuOption> [
    MenuOption(route: "home", name: "Home Screen", screen: const HomeScreen(), icon: Icons.home),
    MenuOption(route: "getvoices", name: "GET Voices", screen: const GetVoices(), icon: Icons.add_reaction_outlined),
    MenuOption(route: "getlanguages", name: "GET languages", screen: const GetLanguages(), icon: Icons.language_outlined),
    MenuOption(route: "postsynthesize", name: "POST text to voice", screen: const PostSynthesize(), icon: Icons.graphic_eq_outlined),
    

  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){ 

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for(final option in menuOptions) {
      appRoutes.addAll({ option.route: (BuildContext context) => option.screen });
    }
    
    return appRoutes;
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