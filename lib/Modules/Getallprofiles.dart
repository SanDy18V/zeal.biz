// To parse this JSON data, do
//
//     final getprofiles = getprofilesFromMap(jsonString);

import 'dart:convert';

Getprofiles getprofilesFromMap(String str) => Getprofiles.fromMap(json.decode(str));

String getprofilesToMap(Getprofiles data) => json.encode(data.toMap());

class Getprofiles {
  Getprofiles({
    this.statuscode,
    this.data,
  });

  String ?statuscode;
  List<Datum> ?data;

  factory Getprofiles.fromMap(Map<String, dynamic> json) => Getprofiles(
    statuscode: json["statuscode"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "statuscode": statuscode,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
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
    this.validity,
    this.profileUrls,
  });

  int ?customerId;
  int ?companyId;
  String ?name;
  int ?profileTypeId;
  String ?profileType;
  String ?bio;
  String ?googlePay;
  String ?phonePe;
  String ?gstNo;
  String ?paytm;
  String ?googleReviewLink;
  dynamic contactPerson;
  dynamic contactPersonPhoneNo;
  String ?userName;
  String ?designation;
  String ?companyName;
  String ?address;
  dynamic companyLogo;
  String ?email;
  String ?phoneNo;
  String ?mobileNo;
  String ?website;
  String ?city;
  String ?state;
  String ?zipcode;
  bool ?isActive;
  List<Service> ?services;
  dynamic validity;
  List<ProfileUrl> ?profileUrls;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
    services: List<Service>.from(json["Services"].map((x) => Service.fromMap(x))),
    validity: json["Validity"],
    profileUrls: List<ProfileUrl>.from(json["ProfileUrls"].map((x) => ProfileUrl.fromMap(x))),
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
    "Services": List<dynamic>.from(services!.map((x) => x.toMap())),
    "Validity": validity,
    "ProfileUrls": List<dynamic>.from(profileUrls!.map((x) => x.toMap())),
  };
}

class ProfileUrl {
  ProfileUrl({
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

  factory ProfileUrl.fromMap(Map<String, dynamic> json) => ProfileUrl(
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

class Service {
  Service({
    this.productId,
    this.name,
    this.type,
    this.imageUrl,
    this.description,
    this.url,
  });

  int ?productId;
  String ?name;
  String ?type;
  String ?imageUrl;
  String ?description;
  String ?url;

  factory Service.fromMap(Map<String, dynamic> json) => Service(
    productId: json["ProductId"],
    name: json["Name"],
    type: json["Type"],
    imageUrl: json["ImageUrl"],
    description: json["Description"],
    url: json["URL"],
  );

  Map<String, dynamic> toMap() => {
    "ProductId": productId,
    "Name": name,
    "Type": type,
    "ImageUrl": imageUrl,
    "Description": description,
    "URL": url,
  };
}
