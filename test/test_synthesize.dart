
import 'package:api_flutter_app/api/post_synthesize_api.dart';
import 'package:api_flutter_app/model/synthesizes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final PostSynthesizeApi api;
  
  setUpAll(() => api = PostSynthesizeApi(
      baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '71b10a6f98mshdc9ece279ddb673p1497fcjsn126ff054cc69'));

  test('Post Synthesize', () async {
    final Audio audios = await api.postSynthesize(languageCode: "es-ES-1", text: "Hola Cómo estas?, prueba 1");


    print(audios.audioUrl);

  });

}