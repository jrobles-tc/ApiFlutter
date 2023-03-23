
import 'package:api_flutter_app/screens/screens.dart';

import 'package:flutter/material.dart';

import '../router/app_routes.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final MenuOptions = AppRoutes.menuOptions;

    return Scaffold(
      
      appBar: AppBar(
        title: const Center(child:  Text("API Text to Voice")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [        
          const Center(
            child:  Text("Bienvenido a la app!", style: TextStyle(fontSize: 25,))
          ),

          const CustomCardType2(imageUrl: "https://cdn-icons-png.flaticon.com/512/9145/9145617.png"),

          const SizedBox(height: 10),

          Center(
            child: ElevatedButton(
              child: const Padding(
                padding:  EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                child:  Text("Da clic para comenzar", style: TextStyle(fontSize: 20)),
              ),

              onPressed:()  {
                  
                  final optionMenu = MaterialPageRoute(
                    //builder: (context) => const ListOption()
                    builder: (context) => SelectScreen()

                  );
                  Navigator.push(context, optionMenu);

                  // Debe ser async el boton {
                  // TextVoiceApi api = TextVoiceApi(baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6');

                  // final List<Voices> voices = await api.getVoices();
                  // print(voices[0].languageCode );
              },
              
            ),
            
          ),

          
          
        ],
      )
      
    
    );
  }
}