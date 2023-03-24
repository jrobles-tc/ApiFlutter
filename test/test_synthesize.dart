
import 'package:api_flutter_app/api/post_synthesize_api.dart';
import 'package:api_flutter_app/model/synthesizes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final PostSynthesizeApi api;
  
  setUpAll(() => api = PostSynthesizeApi(
      baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '12b36e4bcbmsh97e8aa65b2005e3p10e8c0jsna8315a8b970f'));

  test('Post Synthesize', () async {
    final Audio audios = await api.postSynthesize(languageCode: "es-ES-1", text: "Hola Cómo estas?, hoy hay lluvia creo, prueba 1");


    print(audios.audioUrl);

  });

}