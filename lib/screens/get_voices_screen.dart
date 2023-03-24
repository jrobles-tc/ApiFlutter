
import 'package:api_flutter_app/api/get_voices_api.dart';
import 'package:flutter/material.dart';

import '../model/voices.dart';
import '../theme/app_theme.dart';

String textResponse =  "" ;


class GetVoices extends StatefulWidget {


  const GetVoices({Key? key}) : super(key: key);

  @override
  State<GetVoices> createState() => _GetVoicesState();
}

class _GetVoicesState extends State<GetVoices> {
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

                const Center (child: Text("Bienvenido al endpoint GET voices", style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 26, 20, 121), ))),
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
                      GetVoicesApi api = GetVoicesApi(baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6');

                      final List<Voices> voices = await api.getVoices();

                      for(int i=0; i<voices.length; i++ ){
                        print("Voice #$i\n"
                        "Language Code: ${voices[i].languageCode}\n"
                        "Language Name: ${voices[i].languageName}\n"
                        "Voice Type: ${voices[i].voiceType}\n"
                        "Voice Code: ${voices[i].voiceCode}\n"
                        "Voice Gender: ${voices[i].voiceGender}\n");

                        textResponse= textResponse+"Voice #$i\n"
                        "Language Code: ${voices[i].languageCode}\n"
                        "Language Name: ${voices[i].languageName}\n"
                        "Voice Type: ${voices[i].voiceType}\n"
                        "Voice Code: ${voices[i].voiceCode}\n"
                        "Voice Gender: ${voices[i].voiceGender}\n\n";

                        
                        
                        
                      }

                      
                      setState(() {});     
                    },
                    
                ),
                
                const SizedBox(height: 30),

                CardResponse()

              ],
            )
          )

      ),

  
    );
  
  }
}

class CardResponse extends StatelessWidget {
  const CardResponse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.api_outlined, color: AppTheme.primary),
            title: const Text("Response: ", style: TextStyle(color: AppTheme.primary, fontSize: 21)), 
            subtitle: Text(textResponse ),
            
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