// To parse this JSON data, do
//
//     final personalpicupload = personalpicuploadFromMap(jsonString);

import 'dart:convert';

Personalpicupload personalpicuploadFromMap(String str) => Personalpicupload.fromMap(json.decode(str));

String personalpicuploadToMap(Personalpicupload data) => json.encode(data.toMap());

class Personalpicupload {
  Personalpicupload({
    this.data,
    this.statuscode,
    this.message,
  });

  Data ?data;
  String ?statuscode;
  String ?message;

  factory Personalpicupload.fromMap(Map<String, dynamic> json) => Personalpicupload(
    data: Data.fromMap(json["data"]),
    statuscode: json["statuscode"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "data": data!.toMap(),
    "statuscode": statuscode,
    "message": message,
  };
}

class Data {
  Data({
    this.profileImageUrl,
  });

  String ?profileImageUrl;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    profileImageUrl: json["ProfileImageUrl"],
  );

  Map<String, dynamic> toMap() => {
    "ProfileImageUrl": profileImageUrl,
  };
}
