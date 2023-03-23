import "package:api_flutter_app/model/voices.dart";
import "package:dio/dio.dart";

class TextVoiceApi {
  TextVoiceApi({
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

  Future<List<Voices>> getVoices({String? code}) async {

    Map<String, dynamic> param = {"language_code": code}; //optional param

    const String path = "/voices";
    final List<Voices> result = [];
    final response = await dio.get(path, queryParameters: param);   //optional param


    if (response.data != null) {
      final voices = response.data["voices"];
      for (Map<String, dynamic> voice in voices) {
        result.add(voicesFromJson(voice));
      }
    }

    return result;
  }

 
}


//key: 7fc4dc9e81msh8d1b5a3ada41d4fp16abc9jsn576adf76dbf6
