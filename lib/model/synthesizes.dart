import 'dart:convert';

Audio synthesizesFromJson(Map<String, dynamic> str) => Audio.fromJson(str);

String synthesizesToJson(Audio data) => json.encode(data.toJson());

class Audio{
  
    Audio({
        required this.audioUrl,
    });

    String audioUrl;

    factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        audioUrl: json["audio_url"],
    );

    Map<String, dynamic> toJson() => {
        "audio_url": audioUrl,
    };
}
