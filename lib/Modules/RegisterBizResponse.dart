// To parse this JSON data, do
//
//     final profilecard = profilecardFromMap(jsonString);

import 'dart:convert';

Bizcard BizcardFromMap(String str) => Bizcard.fromMap(json.decode(str));

String BizcardToMap(Bizcard data) => json.encode(data.toMap());

class Bizcard {
  Bizcard({
    this.statuscode,
    this.message,
    this.data,
  });

  String? statuscode;
  String? message;
  Data? data;

  factory Bizcard.fromMap(Map<String, dynamic> json) => Bizcard(
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