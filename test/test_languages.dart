import 'package:api_flutter_app/api/get_languages_api.dart';
import 'package:api_flutter_app/model/languages.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late final GetLanguagesApi api;

  setUpAll(() => api = GetLanguagesApi(
      baseUrl: 'https://cloudlabs-text-to-speech.p.rapidapi.com', apiKey: '7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6'));

  test('Get languges', () async {
    final List<Languages> languages = await api.getLanguages();

    for (Languages language in languages) {
        print(language.languageName);
    }

    print(languages.length);

  });

}