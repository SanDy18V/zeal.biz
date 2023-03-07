// To parse this JSON data, do
//
//     final getprofilesbyid = getprofilesbyidFromMap(jsonString);

import 'dart:convert';

Getprofilesbyid getprofilesbyidFromMap(String str) => Getprofilesbyid.fromMap(json.decode(str));

String getprofilesbyidToMap(Getprofilesbyid data) => json.encode(data.toMap());

class Getprofilesbyid {
  Getprofilesbyid({
    this.statuscode,
    this.data,
  });

  String ?statuscode;
  Dataper ?data;

  factory Getprofilesbyid.fromMap(Map<String, dynamic> json) => Getprofilesbyid(
    statuscode: json["statuscode"],
    data: Dataper.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "statuscode": statuscode,
    "data": data!.toMap(),
  };
}

class Dataper {
  Dataper({
    this.customerId,
    this.companyId,
    this.name,
    this.profileTypeId,
    this.profileType,
    this.bio,
    this.googlePay,
    this.phonePe,
    this.gstNo,
    this.paytm,
    this.googleReviewLink,
    this.contactPerson,
    this.contactPersonPhoneNo,
    this.userName,
    this.designation,
    this.companyName,
    this.address,
    this.companyLogo,
    this.email,
    this.phoneNo,
    this.mobileNo,
    this.website,
    this.city,
    this.state,
    this.zipcode,
    this.isActive,
    this.services,
    this.trialValidity,
    this.validity,
    this.profileUrls,
  });

  int ?customerId;
  int ?companyId;
  String ?name;
  int ?profileTypeId;
  String ?profileType;
  dynamic bio;
  String ?googlePay;
  String ?phonePe;
  dynamic gstNo;
  String ?paytm;
  dynamic googleReviewLink;
  dynamic contactPerson;
  dynamic contactPersonPhoneNo;
  String ?userName;
  String ?designation;
  String ?companyName;
  String ?address;
  String ?companyLogo;
  String ?email;
  dynamic phoneNo;
  String ?mobileNo;
  dynamic website;
  String ?city;
  String ?state;
  String ?zipcode;
  bool ?isActive;
  List<dynamic> ?services;
  DateTime ?trialValidity;
  dynamic validity;
  List<ProfileUrlpersonal> ?profileUrls;

  factory Dataper.fromMap(Map<String, dynamic> json) => Dataper(
    customerId: json["CustomerId"],
    companyId: json["CompanyId"],
    name: json["Name"],
    profileTypeId: json["ProfileTypeId"],
    profileType: json["ProfileType"],
    bio: json["Bio"],
    googlePay: json["GooglePay"],
    phonePe: json["PhonePe"],
    gstNo: json["GstNo"],
    paytm: json["Paytm"],
    googleReviewLink: json["GoogleReviewLink"],
    contactPerson: json["ContactPerson"],
    contactPersonPhoneNo: json["ContactPersonPhoneNo"],
    userName: json["UserName"],
    designation: json["Designation"],
    companyName: json["CompanyName"],
    address: json["Address"],
    companyLogo: json["CompanyLogo"],
    email: json["Email"],
    phoneNo: json["PhoneNo"],
    mobileNo: json["MobileNo"],
    website: json["Website"],
    city: json["City"],
    state: json["State"],
    zipcode: json["Zipcode"],
    isActive: json["IsActive"],
    services: List<dynamic>.from(json["Services"].map((x) => x)),
    trialValidity: DateTime.parse(json["TrialValidity"]),
    validity: json["Validity"],
    profileUrls: List<ProfileUrlpersonal>.from(json["ProfileUrls"].map((x) => ProfileUrlpersonal.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "CustomerId": customerId,
    "CompanyId": companyId,
    "Name": name,
    "ProfileTypeId": profileTypeId,
    "ProfileType": profileType,
    "Bio": bio,
    "GooglePay": googlePay,
    "PhonePe": phonePe,
    "GstNo": gstNo,
    "Paytm": paytm,
    "GoogleReviewLink": googleReviewLink,
    "ContactPerson": contactPerson,
    "ContactPersonPhoneNo": contactPersonPhoneNo,
    "UserName": userName,
    "Designation": designation,
    "CompanyName": companyName,
    "Address": address,
    "CompanyLogo": companyLogo,
    "Email": email,
    "PhoneNo": phoneNo,
    "MobileNo": mobileNo,
    "Website": website,
    "City": city,
    "State": state,
    "Zipcode": zipcode,
    "IsActive": isActive,
    "Services": List<dynamic>.from(services!.map((x) => x)),
    "TrialValidity": trialValidity!.toIso8601String(),
    "Validity": validity,
    "ProfileUrls": List<dynamic>.from(profileUrls!.map((x) => x.toMap())),
  };
}

class ProfileUrlpersonal{
  ProfileUrlpersonal({
    this.id,
    this.socialMediaTypeId,
    this.socialMediaType,
    this.userName,
    this.socialMediaImageUrl,
    this.mediaBaseUrl,
  });

  int ?id;
  int ?socialMediaTypeId;
  String ?socialMediaType;
  String ?userName;
  String ?socialMediaImageUrl;
  String ?mediaBaseUrl;

  factory ProfileUrlpersonal.fromMap(Map<String, dynamic> json) => ProfileUrlpersonal(
    id: json["ID"],
    socialMediaTypeId: json["SocialMediaTypeId"],
    socialMediaType: json["SocialMediaType"],
    userName: json["UserName"],
    socialMediaImageUrl: json["SocialMediaImageUrl"],
    mediaBaseUrl: json["MediaBaseUrl"],
  );

  Map<String, dynamic> toMap() => {
    "ID": id,
    "SocialMediaTypeId": socialMediaTypeId,
    "SocialMediaType": socialMediaType,
    "UserName": userName,
    "SocialMediaImageUrl": socialMediaImageUrl,
    "MediaBaseUrl": mediaBaseUrl,
  };
}
