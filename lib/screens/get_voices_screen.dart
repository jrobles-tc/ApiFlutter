import 'package:api_flutter_app/widgets/custom_card_type1.dart';
import 'package:flutter/material.dart';

import '../api/text_voice_api.dart';
import '../model/voices.dart';
import '../theme/app_theme.dart';

String textResponse =  "Aqui aparecera la respuesta generada por el metodo GET de la API" ;

class GetVoices extends StatelessWidget {


  const GetVoices({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET Voices"),
      ), 
      body: SingleChildScrollView(
  
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [

                const Center (child: Text("Bienvenido al endpoint GET voices", style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 243, 219, 0)))),
                const SizedBox(height: 30),
                const Text("para comenzar puedes realizar la consulta o bien, poner una opcion como párametro"),
                const SizedBox(height: 20),

                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      ) 
                      ),
                      contentPadding: EdgeInsets.all(20),
                      fillColor: Colors.deepPurpleAccent,
                      hintText: "language_code: OPTIONAL",
                      hintStyle: TextStyle(color: Colors.grey)),

                      
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                    child: const Padding(
                      padding:  EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                      child:  Text("GET", style: TextStyle(fontSize: 20)),
                    ),

                    onPressed:() async {

                      // Debe ser async el boton {
                      TextVoiceApi api = TextVoiceApi(baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6');

                      final List<Voices> voices = await api.getVoices();

                      for(int i=0; i<voices.length; i++ ){
                        print(voices[i].languageCode );
                      }
                  
                      

                      textResponse = voices[0].languageCode;
                           
                    },
                    
                ),
                
                const SizedBox(height: 30),

                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.api_outlined, color: AppTheme.primary),
                        title: const Text("Response: ", style: TextStyle(color: AppTheme.primary, fontSize: 21)), 
                        subtitle: Text(textResponse , style: const TextStyle(color: Colors.grey)),
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
                )

              ],
            )
          )

      ),

  
    );
  
  }
  
}