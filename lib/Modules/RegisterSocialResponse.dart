// To parse this JSON data, do
//
//     final profilecard = profilecardFromMap(jsonString);

import 'dart:convert';

Socialcard SocialcardFromMap(String str) => Socialcard.fromMap(json.decode(str));

String SocialcardToMap(Socialcard data) => json.encode(data.toMap());

class Socialcard {
  Socialcard({
    this.statuscode,
    this.message,
    this.data,
  });

  String? statuscode;
  String? message;
  Data? data;

  factory Socialcard.fromMap(Map<String, dynamic> json) => Socialcard(
    statuscode: json["statuscode"],
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "statuscode": statuscode,
    "message": message,
    "data": data!.toMap(),
  };
}

class Data {
  Data({
    this.companyId,
  });

  int ?companyId;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    companyId: json["CompanyId"],
  );

  Map<String, dynamic> toMap() => {
    "CompanyId": companyId,
  };
}