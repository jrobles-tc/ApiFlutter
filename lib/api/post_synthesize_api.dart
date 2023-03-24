import "package:api_flutter_app/model/synthesizes.dart";
import "package:dio/dio.dart";

class PostSynthesizeApi {
  PostSynthesizeApi({
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
            'useQueryString': true
          },
        ));

  final Dio dio;
  final String baseUrl;
  final String rapidApiHost;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final String apiKey;



  Future<Audio?> postSynthesize({required String languageCode, required String text}) async {

    const String path = "/synthesize";

    Audio? audioResponse;


    Map<String, dynamic> params = {"voice_code": languageCode, "text": text, "speed":  "1.00", "pitch": "1.00", "output_type": "audio_url"};

    final response = await dio.post(path, data: params);   


    if (response.data != null) {
      final audios = response.data["result"];

        audioResponse = Audio.fromJson(audios!);
      
    }


  return audioResponse;
  
  }

 
}



