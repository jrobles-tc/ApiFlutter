import "package:api_flutter_app/model/languages.dart";
import "package:api_flutter_app/screens/get_languages_screen.dart";
import "package:dio/dio.dart";

class GetLanguagesApi {
  GetLanguagesApi({
    required this.baseUrl,
    required this.apiKey,
    this.rapidApiHost = 'cloudlabs-text-to-speech.p.rapidapi.com',
    this.connectTimeout = const Duration(seconds: 5),
    this.receiveTimeout = const Duration(seconds: 5),
  }) : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
          headers: {
            "content-type": "application/x-www-form-urlencoded",
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': rapidApiHost,
          },
        ));

  final Dio dio;
  final String baseUrl;
  final String rapidApiHost;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final String apiKey;


  //estancia de laguges se necesita primero
  Future<List<Languages>> getLanguages({String? laguageCode}) async {

    const String path = "/languages";
    final List<Languages> result = [];
    final response = await dio.get(path);   


    if (response.data != null) {
      final languages = response.data["languages"];
      for (Map<String, dynamic> language in languages) {
        result.add(languagesFromJson(language));
      }
    }

    return result;
  }

 
}



