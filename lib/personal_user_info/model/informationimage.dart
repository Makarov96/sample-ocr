import 'dart:convert';

Informationimage informationimageFromJson(String str) => Informationimage.fromJson(json.decode(str));

String informationimageToJson(Informationimage data) => json.encode(data.toJson());

class Informationimage {
    String message;
    String ocr;
    int code;

    Informationimage({
        this.message,
        this.ocr,
        this.code,
    });

    factory Informationimage.fromJson(Map<String, dynamic> json) => Informationimage(
        message: json["message"],
        ocr: json["ocr"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "ocr": ocr,
        "code": code,
    };
}