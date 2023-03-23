import 'dart:convert';

Voices voicesFromJson(Map<String, dynamic> str) => Voices.fromJson(str);

String voicesToJson(Voices data) => json.encode(data.toJson());

class Voices {
    Voices({
        required this.languageCode,
        required this.languageName,
        required this.voiceType,
        required this.voiceCode,
        required this.voiceGender,
    });

    String languageCode;
    String languageName;
    String voiceType;
    String voiceCode;
    String voiceGender;

    factory Voices.fromJson(Map<String, dynamic> json) => Voices(
        languageCode: json["language_code"],
        languageName: json["language_name"],
        voiceType: json["voice_type"],
        voiceCode: json["voice_code"],
        voiceGender: json["voice_gender"],
    );

    Map<String, dynamic> toJson() => {
        "language_code": languageCode,
        "language_name": languageName,
        "voice_type": voiceType,
        "voice_code": voiceCode,
        "voice_gender": voiceGender,
    };
    
}
