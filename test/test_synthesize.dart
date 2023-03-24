
import 'package:api_flutter_app/api/post_synthesize_api.dart';
import 'package:api_flutter_app/model/synthesizes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final PostSynthesizeApi api;
  
  setUpAll(() => api = PostSynthesizeApi(
      baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6'));

  test('Post Synthesize', () async {
    final Audio? audios = await api.postSynthesize(languageCode: "es-ES-1", text: "Hola Cómo estas?, hoy hay lluvia creo, prueba 1");

    if(audios != null)
      print(audios.audioUrl);

  });

}