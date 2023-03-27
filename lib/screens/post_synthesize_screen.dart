import 'package:api_flutter_app/api/post_synthesize_api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../model/synthesizes.dart';
import '../theme/app_theme.dart';

String textResponse =  "" ;

class PostSynthesize extends StatefulWidget {

  
  const PostSynthesize({Key? key}) : super(key: key);

  @override
  State<PostSynthesize> createState() => _GetSynthesizeState();
}

class _GetSynthesizeState extends State<PostSynthesize> {

  final languageCodeUserS= TextEditingController();
  final textTraductor= TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Texto a voz"),
      ), 
      body: SingleChildScrollView(
  
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [

                const Center (child: Text("Bienvenido al endpoint POST voces", style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 26, 20, 121), ))),
                const SizedBox(height: 30),
                const Text("para comenzar escribe una frase y el lenguaje en que deseas escucharlo!, por defecto puedes colocar laguage code: es-ES-1 "),
                const SizedBox(height: 20),

                TextFormField(
                  controller: languageCodeUserS,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      ) 
                      ),
                      contentPadding: EdgeInsets.all(20),
                      fillColor: Colors.deepPurpleAccent,
                      hintText: "language_code: REQUIRED",
                      hintStyle: TextStyle(color: Colors.grey)),
                      
                ),

                TextFormField(
                  controller: textTraductor,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      ) 
                      ),
                      contentPadding: EdgeInsets.all(20),
                      fillColor: Colors.deepPurpleAccent,
                      hintText: "text: REQUIRED",
    
                      hintStyle: TextStyle(color: Colors.grey)),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                    child: const Padding(
                      padding:  EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                      child:  Text("POST texto a voz", style: TextStyle(fontSize: 20)),
                    ),

                    onPressed:() async {

                      // Debe ser async el boton {
                      PostSynthesizeApi api = PostSynthesizeApi(baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: 'e8a014fa78msh8ad297f66e6d143p1b2790jsncfa2181d037b');

                      final Audio audio = await api.postSynthesize(languageCode: languageCodeUserS.text, text: textTraductor.text);

                      print(audio.audioUrl);
                      textResponse = audio.audioUrl;
                      
                      setState(() {});     
                    },
                    
                ),
                
                const SizedBox(height: 30),

                CardResponse(),

                const SizedBox(height: 30),

                ElevatedButton(
                  
                  onPressed: () {
                    launchUrlString(textResponse);
                    setState(() { });
                  }, 
                  child: const Text("Reproducir en el navegador")
                )

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


void _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL $url';
    }
  }