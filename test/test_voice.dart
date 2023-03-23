import 'package:api_flutter_app/api/text_voice_api.dart';
import 'package:api_flutter_app/model/voices.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late final TextVoiceApi api;

  setUpAll(() => api = TextVoiceApi(
      baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6'));

  test('Get voices', () async {
    final List<Voices> voices = await api.getVoices(code: "zh-TW");

    for (Voices voice in voices) {
        print(voice.languageCode);
    }

  });

}