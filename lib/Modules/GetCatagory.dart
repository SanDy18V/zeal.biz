// To parse this JSON data, do
//
//     final getcategory = getcategoryFromMap(jsonString);

import 'dart:convert';

Getcategory getcategoryFromMap(String str) => Getcategory.fromMap(json.decode(str));

String getcategoryToMap(Getcategory data) => json.encode(data.toMap());

class Getcategory {
  Getcategory({
    this.statuscode,
    this.data,
  });

  String ?statuscode;
  List<Datas> ?data;

  factory Getcategory.fromMap(Map<String, dynamic> json) => Getcategory(
    statuscode: json["statuscode"],
    data: List<Datas>.from(json["data"].map((x) => Datas.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "statuscode": statuscode,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datas {
  Datas({
    this.categoryId,
    this.category,
    this.colorCode,
  });

  int ?categoryId;
  String ?category;
  String ?colorCode;

  factory Datas.fromMap(Map<String, dynamic> json) => Datas(
    categoryId: json["CategoryId"],
    category: json["Category"],
    colorCode: json["ColorCode"],
  );

  Map<String, dynamic> toMap() => {
    "CategoryId": categoryId,
    "Category": category,
    "ColorCode": colorCode,
  };
}
