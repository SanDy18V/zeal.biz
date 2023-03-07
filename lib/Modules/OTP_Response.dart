// To parse this JSON data, do
//
//     final otp = otpFromMap(jsonString);

import 'dart:convert';

Otp otpFromMap(String str) => Otp.fromJson(json.decode(str));

String otpToMap(Otp data) => json.encode(data.toJson());

class Otp {
  Otp({
    this.statuscode,
    this.message,
    this.data,
  });

  String ?statuscode;
  String ?message;
  Datass ?data;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
    statuscode: json["statuscode"],
    message: json["message"],
    data: Datass.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statuscode": statuscode,
    "message": message,
    "data": data!.toJson(),
  };
}

class Datass {
  Datass({
    this.accessToken,
    this.tokenType,
    this.customerId,
    this.name,
    this.phoneNo,
    this.corporateId,
    this.socialMediaTypes,
    this.categories,
    this.profiles,
    this.profileTypes,
  });

  String ?accessToken;
  String ?tokenType;
  int ?customerId;
  dynamic name;
  String ?phoneNo;
  dynamic corporateId;
  List<SocialMediaType> ?socialMediaTypes;
  List<Category> ?categories;
  List<Profile> ?profiles;
  List<ProfileType> ?profileTypes;

  factory Datass.fromJson(Map<String, dynamic> json) => Datass(
    accessToken: json["Access_Token"],
    tokenType: json["Token_Type"],
    customerId: json["CustomerId"],
    name: json["Name"],
    phoneNo: json["PhoneNo"],
    corporateId: json["CorporateId"],
    socialMediaTypes: List<SocialMediaType>.from(json["SocialMediaTypes"].map((x) => SocialMediaType.fromJson(x))),
    categories: List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
    profiles: List<Profile>.from(json["Profiles"].map((x) => Profile.fromJson(x))),
    profileTypes: List<ProfileType>.from(json["ProfileTypes"].map((x) => ProfileType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Access_Token": accessToken,
    "Token_Type": tokenType,
    "CustomerId": customerId,
    "Name": name,
    "PhoneNo": phoneNo,
    "CorporateId": corporateId,
    "SocialMediaTypes": List<dynamic>.from(socialMediaTypes!.map((x) => x.toJson())),
    "Categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "Profiles": List<dynamic>.from(profiles!.map((x) => x.toJson())),
    "ProfileTypes": List<dynamic>.from(profileTypes!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.categoryId,
    this.category,
    this.colorCode,
  });

  int ?categoryId;
  String ?category;
  dynamic colorCode;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["CategoryId"],
    category: json["Category"],
    colorCode: json["ColorCode"],
  );

  Map<String, dynamic> toJson() => {
    "CategoryId": categoryId,
    "Category": category,
    "ColorCode": colorCode,
  };
}

class ProfileType {
  ProfileType({
    this.profileTypeId,
    this.profileType,
  });

  int ?profileTypeId;
  String ?profileType;

  factory ProfileType.fromJson(Map<String, dynamic> json) => ProfileType(
    profileTypeId: json["ProfileTypeId"],
    profileType: json["ProfileType"],
  );

  Map<String, dynamic> toJson() => {
    "ProfileTypeId": profileTypeId,
    "ProfileType": profileType,

  };
}

class Profile {
  Profile({
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
  String ?companyLogo;
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
  List<ProfileUrls> ?profileUrls;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    customerId: json["CustomerId"],
    companyId: json["CompanyId"],
    name: json["Name"],
    profileTypeId: json["ProfileTypeId"],
    profileType: json["ProfileType"],
    bio: json["Bio"] == null ? null : json["Bio"],
    googlePay: json["GooglePay"],
    phonePe: json["PhonePe"],
    gstNo: json["GstNo"] == null ? null : json["GstNo"],
    paytm: json["Paytm"],
    googleReviewLink: json["GoogleReviewLink"] == null ? null : json["GoogleReviewLink"],
    contactPerson: json["ContactPerson"],
    contactPersonPhoneNo: json["ContactPersonPhoneNo"],
    userName: json["UserName"],
    designation: json["Designation"] == null ? null : json["Designation"],
    companyName: json["CompanyName"] == null ? null : json["CompanyName"],
    address: json["Address"] == null ? null : json["Address"],
    companyLogo: json["CompanyLogo"] == null ? null : json["CompanyLogo"],
    email: json["Email"],
    phoneNo: json["PhoneNo"] == null ? null : json["PhoneNo"],
    mobileNo: json["MobileNo"] == null ? null : json["MobileNo"],
    website: json["Website"] == null ? null : json["Website"],
    city: json["City"] == null ? null : json["City"],
    state: json["State"] == null ? null : json["State"],
    zipcode: json["Zipcode"] == null ? null : json["Zipcode"],
    isActive: json["IsActive"],
    services: List<Service>.from(json["Services"].map((x) => Service.fromJson(x))),
    validity: json["Validity"],
    profileUrls: List<ProfileUrls>.from(json["ProfileUrls"].map((x) => ProfileUrls.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CustomerId": customerId,
    "CompanyId": companyId,
    "Name": name,
    "ProfileTypeId": profileTypeId,
    "ProfileType": profileType,
    "Bio": bio == null ? null : bio,
    "GooglePay": googlePay,
    "PhonePe": phonePe,
    "GstNo": gstNo == null ? null : gstNo,
    "Paytm": paytm,
    "GoogleReviewLink": googleReviewLink == null ? null : googleReviewLink,
    "ContactPerson": contactPerson,
    "ContactPersonPhoneNo": contactPersonPhoneNo,
    "UserName": userName,
    "Designation": designation == null ? null : designation,
    "CompanyName": companyName == null ? null : companyName,
    "Address": address == null ? null : address,
    "CompanyLogo": companyLogo == null ? null : companyLogo,
    "Email": email,
    "PhoneNo": phoneNo == null ? null : phoneNo,
    "MobileNo": mobileNo == null ? null : mobileNo,
    "Website": website == null ? null : website,
    "City": city == null ? null : city,
    "State": state == null ? null : state,
    "Zipcode": zipcode == null ? null : zipcode,
    "IsActive": isActive,
    "Services": List<dynamic>.from(services!.map((x) =>x.toJson())),
    "Validity": validity,
    "ProfileUrls": List<dynamic>.from(profileUrls!.map((x) => x.toJason())),
  };
}

class ProfileUrls {
  ProfileUrls({
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

  factory ProfileUrls.fromJson(Map<String, dynamic> json) => ProfileUrls(
    id: json["ID"],
    socialMediaTypeId: json["SocialMediaTypeId"],
    socialMediaType: json["SocialMediaType"],
    userName: json["UserName"],
    socialMediaImageUrl: json["SocialMediaImageUrl"],
    mediaBaseUrl: json["MediaBaseUrl"],
  );

  Map<String, dynamic> toJason() => {
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
  dynamic imageUrl;
  String ?description;
  String ?url;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    productId: json["ProductId"],
    name: json["Name"],
    type: json["Type"],
    imageUrl: json["ImageUrl"],
    description: json["Description"],
    url: json["URL"],
  );

  Map<String, dynamic> toJson() => {
    "ProductId": productId,
    "Name": name,
    "Type": type,
    "ImageUrl": imageUrl,
    "Description": description,
    "URL": url,
  };
}

class SocialMediaType {
  SocialMediaType({
    this.socialMediaTypeId,
    this.socialMediaImageUrl,
    this.socialMediaType,
    this.mediaBaseUrl,
  });

  int ?socialMediaTypeId;
  String ?socialMediaImageUrl;
  String ?socialMediaType;
  String ?mediaBaseUrl;

  factory SocialMediaType.fromJson(Map<String, dynamic> json) => SocialMediaType(
    socialMediaTypeId: json["SocialMediaTypeId"],
    socialMediaImageUrl: json["SocialMediaImageUrl"],
    socialMediaType: json["SocialMediaType"],
    mediaBaseUrl: json["MediaBaseUrl"] == null ? null : json["MediaBaseUrl"],
  );

 Map<String, dynamic> toJson() => {
    "SocialMediaTypeId": socialMediaTypeId,
    "SocialMediaImageUrl": socialMediaImageUrl,
    "SocialMediaType": socialMediaType,
    "MediaBaseUrl": mediaBaseUrl == null ? null : mediaBaseUrl,
  };
static Map<String, dynamic> toMap(SocialMediaType socialMediaTypes) => {

  "SocialMediaTypeId": socialMediaTypes.socialMediaTypeId,
  "SocialMediaType": socialMediaTypes.socialMediaType,
  "SocialMediaImageUrl": socialMediaTypes.socialMediaImageUrl,
  "MediaBaseUrl": socialMediaTypes.mediaBaseUrl

};

  static String encode(List<SocialMediaType> socialMediaTypes) => json.encode(
    socialMediaTypes
        .map<Map<String, dynamic>>((socialMediaTypes) => SocialMediaType.toMap(socialMediaTypes))
        .toList(),
  );

  static List<SocialMediaType> decode(String socialMediaTypes) =>
      (json.decode(socialMediaTypes) as List<dynamic>)
          .map<SocialMediaType>((item) => SocialMediaType.fromJson(item))
          .toList();
}
