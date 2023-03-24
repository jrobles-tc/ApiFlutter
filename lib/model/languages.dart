import 'dart:convert';

Languages languagesFromJson(Map<String, dynamic> str) => Languages.fromJson(str);

String languagesToJson(Languages data) => json.encode(data.toJson());

class Languages {
    Languages({
        required this.languageCode,
        required this.languageName,
    });

    String languageCode;
    String languageName;

    factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        languageCode: json["language_code"],
        languageName: json["language_name"],
    );

    Map<String, dynamic> toJson() => {
        "language_code": languageCode,
        "language_name": languageName,
    };
}
