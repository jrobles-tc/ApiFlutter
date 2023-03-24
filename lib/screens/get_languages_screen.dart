import 'package:flutter/material.dart';

import '../api/get_languages_api.dart';
import '../model/languages.dart';
import '../theme/app_theme.dart';

String textResponse =  "" ;


class GetLanguages extends StatefulWidget {


  const GetLanguages({Key? key}) : super(key: key);

  @override
  State<GetLanguages> createState() => _GetLanguagesState();
}

class _GetLanguagesState extends State<GetLanguages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GET Languajes"),
      ), 
      body: SingleChildScrollView(
  
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [

                const Center (child: Text("Bienvenido al endpoint GET Languages", style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 26, 20, 121), ))),
                const SizedBox(height: 30),
                const Text("Puedes realizar tu Consulta de todos los lenguajes disponibles!"),
                const SizedBox(height: 20),

                const SizedBox(height: 20),

                ElevatedButton(
                    child: const Padding(
                      padding:  EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                      child:  Text("GET Languajes", style: TextStyle(fontSize: 20)),
                    ),

                    onPressed:() async {

                      // Debe ser async el boton {
                      GetLanguagesApi api = GetLanguagesApi(baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6');

                      final List<Languages> languages = await api.getLanguages();

                      for(int i=0; i<languages.length; i++ ){
                        print("Language #$i\n"
                        "Language Code: ${languages[i].languageCode}\n"
                        "Language Name: ${languages[i].languageName}\n\n");

                        textResponse= textResponse + "Language #$i\n"
                        "Language Code: ${languages[i].languageCode}\n"
                        "Language Name: ${languages[i].languageName}\n\n";
                      }
                      
                       setState(() {
                         
                       });
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

class CardResponse extends StatefulWidget {
  const CardResponse({
    super.key,
  });

  @override
  State<CardResponse> createState() => _CardResponseState();
}

class _CardResponseState extends State<CardResponse> {
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
                  onPressed: () {
                    textResponse= "";
                    setState(() { });
                  }, 
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