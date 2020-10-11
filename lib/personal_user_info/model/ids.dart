// To parse this JSON data, do
//
//     final idModel = idModelFromJson(jsonString);

import 'dart:convert';

IdModel idModelFromJson(String str) => IdModel.fromJson(json.decode(str));

String idModelToJson(IdModel data) => json.encode(data.toJson());

class IdModel {
    String message;
    List<Object> object;
    int code;

    IdModel({
        this.message,
        this.object,
        this.code,
    });

    factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        message: json["message"],
        object: List<Object>.from(json["object"].map((x) => Object.fromJson(x))),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "object": List<dynamic>.from(object.map((x) => x.toJson())),
        "code": code,
    };
}

class Object {
    String id;
    String blur;

    Object({
        this.id,
        this.blur,
    });

    factory Object.fromJson(Map<String, dynamic> json) => Object(
        id: json["id"],
        blur: json["blur"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "blur": blur,
    };
}