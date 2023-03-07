// To parse this JSON data, do
//
//     final getCardprice = getCardpriceFromMap(jsonString);

import 'dart:convert';

GetCardprice getCardpriceFromMap(String str) => GetCardprice.fromMap(json.decode(str));

String getCardpriceToMap(GetCardprice data) => json.encode(data.toMap());

class GetCardprice {
  GetCardprice({
    this.statuscode,
    this.data,
  });

  String ?statuscode;
  Datas ?data;

  factory GetCardprice.fromMap(Map<String, dynamic> json) => GetCardprice(
    statuscode: json["statuscode"],
    data: Datas.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "statuscode": statuscode,
    "data": data!.toMap(),
  };
}

class Datas {
  Datas({
    this.actualPrice,
    this.discountedPrice,
    this.validityYears,
  });

  int ?actualPrice;
  int ?discountedPrice;
  int ?validityYears;

  factory Datas.fromMap(Map<String, dynamic> json) => Datas(
    actualPrice: json["ActualPrice"].toInt(),
    discountedPrice: json["DiscountedPrice"].toInt(),
    validityYears: json["ValidityYears"],
  );

  Map<String, dynamic> toMap() => {
    "ActualPrice": actualPrice,
    "DiscountedPrice": discountedPrice,
    "ValidityYears": validityYears,
  };
}
