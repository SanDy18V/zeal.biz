// To parse this JSON data, do
//
//     final mobileVerfication = mobileVerficationFromMap(jsonString);

import 'dart:convert';

MobileVerfication mobileVerficationFromMap(String str) => MobileVerfication.fromMap(json.decode(str));

String mobileVerficationToMap(MobileVerfication data) => json.encode(data.toMap());

class MobileVerfication {
  MobileVerfication({
    this.statuscode,
    this.message,
    this.data,
  });

  String ?statuscode;
  String ?message;
  Data ?data;

  factory MobileVerfication.fromMap(Map<String, dynamic> json) => MobileVerfication(
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
    this.customerId,
    this.phoneNo,
    this.otpExpiredOn,
  });

  int ?customerId;
  String ?phoneNo;
  DateTime ?otpExpiredOn;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    customerId: json["CustomerId"],
    phoneNo: json["PhoneNo"],
    otpExpiredOn: DateTime.parse(json["OTPExpiredOn"]),
  );

  Map<String, dynamic> toMap() => {
    "CustomerId": customerId,
    "PhoneNo": phoneNo,
    "OTPExpiredOn": otpExpiredOn!.toIso8601String(),
  };
}
