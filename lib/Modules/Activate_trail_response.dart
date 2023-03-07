// To parse this JSON data, do
//
//     final activatetrail = activatetrailFromMap(jsonString);

import 'dart:convert';

Activatetrail activatetrailFromMap(String str) => Activatetrail.fromMap(json.decode(str));

String activatetrailToMap(Activatetrail data) => json.encode(data.toMap());

class Activatetrail {
  Activatetrail({
    this.statuscode,
    this.message,
    this.data,
  });

  String ?statuscode;
  String ?message;
  Datas ?data;

  factory Activatetrail.fromMap(Map<String, dynamic> json) => Activatetrail(
    statuscode: json["statuscode"],
    message: json["message"],
    data: Datas.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "statuscode": statuscode,
    "message": message,
    "data": data!.toMap(),
  };
}

class Datas {
  Datas({
    this.businessUrl,
    this.expiryDate,
  });

  String ?businessUrl;
  DateTime ?expiryDate;

  factory Datas.fromMap(Map<String, dynamic> json) => Datas(
    businessUrl: json["BusinessURL"],
    expiryDate: DateTime.parse(json["ExpiryDate"]),
  );

  Map<String, dynamic> toMap() => {
    "BusinessURL": businessUrl,
    "ExpiryDate": expiryDate!.toIso8601String(),
  };
}
