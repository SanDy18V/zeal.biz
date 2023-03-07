
import 'dart:convert';
import 'dart:core';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';
import 'package:zeal_biz/Modules/GetCardprice_Response.dart';
import 'package:zeal_biz/Modules/Getallprofiles.dart';
import 'package:zeal_biz/Modules/OTP_Response.dart';
import 'package:zeal_biz/Modules/RegisterBizResponse.dart';
import 'package:zeal_biz/Modules/RegisterSocialResponse.dart';
import 'package:zeal_biz/Modules/getprofilesbyidbiz.dart';

import 'package:zeal_biz/Modules/verificatiion_response.dart';
import 'package:zeal_biz/Navigation/bottom_bar.dart';

import '../Modules/ReisterProfileResponse.dart';
import '../Modules/getprofilesbyid Personal.dart';
import '../Modules/getprofilesbyid Social.dart';
import '../widgets/sharedPreference.dart';


const PHONEVERIFICATION= "api/customer/SendOTP";

const OTPVERIFICATION= "api/customer/VerifyOTP";

const CREATEPROFILECARD="api/customer/updateprofile";
const EDITPROFILECARD="api/customer/updateprofile";
const CREATEBIZCARD= "api/customer/updateprofile";
const EDITBIZCARD= "api/customer/updateprofile";
const CREATESOCIALCARD= "api/customer/updateprofile";
const EDITSOCIALCARD= "api/customer/updateprofile";
const UPLOAD_PROFILE_PIC="api/customer/uploadlogo";
const GETPROFILEAll ="api/customer/GetProfiles";
const GETPROFILEID = "api/customer/getprofiledetail";
const GETCARDPRICE ="api/customer/GetCardPrice";

var AppName = "ZEAL.BIZ";

class ApiService {
  static String BASE_URL = "https://zeal.biz/";

  static String Access_token = "";


  static int indexValue = 0;

  static int sortOrderIndex = 0;



  showProgressDialog() {
    EasyLoading.show(
      indicator:CircularProgressIndicator(),
        status: 'loading...');
  }

  dismissDialog() {
    EasyLoading.dismiss();
  }

  Future<bool> verficationApi(
      Map<String, String> param, BuildContext context) async {
    showProgressDialog();
   // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + PHONEVERIFICATION ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
         // 'Authorization': "bearer " + Utils.userData.accessToken!,
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(response.statusCode);
    print(jsonEncode(param));

    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);
        dismissDialog();
    if (response.statusCode == 200) {
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      Utils.verfication=MobileVerfication.fromMap(dataObject);
     // Shared_Preferences().saveIntValue("CustomerId",dataObject["data"]["CustomerId"]);
    //  Shared_Preferences().setStringValue("CustomerId", dataObject["data"]["CustomerId".toString()]);
   //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);

      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }

  Future<bool> Otpverfication(
      Map<String, String> param, BuildContext context) async {
  showProgressDialog();
    bool status = false;
    String finalURL = BASE_URL + OTPVERIFICATION  ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          // 'Authorization': "bearer " + Utils.userData.accessToken!,
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(response.statusCode);
    print(jsonEncode(param));

    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);
    dismissDialog();
    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);

      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());


     Utils.otpResponse=Otp.fromJson(dataObject);

      //  Utils.userData = LoginCredentials.fromJson(dataObject);
      final SharedPreferences prefs =await SharedPreferences.getInstance();
      Shared_Preferences().setToken(dataObject["data"]['Access_Token'].toString());
        // Shared_Preferences().setSocialMediaTypes(dataObject["data"]["SocialMediaTypes"]);

      // List<dynamic> test = dataObject["data"]["SocialMediaTypes"];
      //
      //  Utils.socialMediaTypes = test.map((test) =>SocialMediaType.fromJson(test)).toList();
      // final String encodedData = SocialMediaType.encode(Utils.socialMediaTypes);
      //
      // await prefs.setString('socialMediaTypes', encodedData);
      Shared_Preferences().setLoggedIn(true);
      Get.to(()=>Bottom());

      status = true;
    } else {
      var data = jsonDecode(response.body);
       dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }


//////////////////////Upadate The  Profiles Api///////////////////
  Future<bool> ProfileCardAPi(
      Map<String,dynamic> param, BuildContext context) async
  {
    showProgressDialog();
    // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + EDITPROFILECARD ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
           'Authorization':" bearer ${Utils.access_token}",
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(HttpHeaders.acceptHeader);
    print(response.statusCode);
    print(jsonEncode(param));
    dismissDialog();
    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);

    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      Utils. profileCardresponse =Profilecard.fromMap(dataObject);

      Shared_Preferences().saveIntValue("CompanyId",dataObject["data"]["CompanyId"]);
      // Utils.verfication=MobileVerfication.fromMap(dataObject);

      //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);



      /////////////////////////////////////



      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }

  Future<bool> BizCardAPi(
      Map<String,dynamic> param, BuildContext context) async
  {
    showProgressDialog();
    // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + EDITBIZCARD;

    var url = Uri.parse(finalURL);

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':" bearer ${Utils.access_token}",
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(HttpHeaders.acceptHeader);
    print(response.statusCode);
    print(jsonEncode(param));
    dismissDialog();
    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);

    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      Utils.verfication=MobileVerfication.fromMap(dataObject);

      //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);



      /////////////////////////////////////



      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }

  Future<bool> SocialCardAPi(
      Map<String,dynamic> param, BuildContext context) async
  {
    showProgressDialog();
    // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + EDITSOCIALCARD  ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':" bearer ${Utils.access_token}",
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(HttpHeaders.acceptHeader);
    print(response.statusCode);
    print(jsonEncode(param));
    dismissDialog();
    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);

    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      Utils.verfication=MobileVerfication.fromMap(dataObject);

      //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);



      /////////////////////////////////////



      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }



  ////////////First Time Create And get Companyid For Profiles//////////////////
  Future<bool> CreateProfileCardAPi(
      Map<String,dynamic> param, BuildContext context) async
  {
    showProgressDialog();
    // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + CREATEPROFILECARD  ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':" bearer ${Utils.access_token}",
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(HttpHeaders.acceptHeader);
    print(response.statusCode);
    print(jsonEncode(param));
    dismissDialog();
    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);

    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      // Utils.verfication=MobileVerfication.fromMap(dataObject);
      //  Shared_Preferences().saveIntValue("CompanyId",dataObject["data"]["CompanyId"]);
      Utils.profileCardresponse=Profilecard.fromMap(dataObject);
      // Shared_Preferences().setStringValue("CompanyId", dataObject["data"]["CompanyId".toString()]);
      //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);



      /////////////////////////////////////



      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }
  Future<bool> CreateBizCardAPi(
      Map<String,dynamic> param, BuildContext context) async
  {
    showProgressDialog();
    // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + CREATEBIZCARD ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':" bearer ${Utils.access_token}",
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(HttpHeaders.acceptHeader);
    print(response.statusCode);
    print(jsonEncode(param));
    dismissDialog();
    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);

    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      //  Utils.verfication=MobileVerfication.fromMap(dataObject);
      Utils.bizcardresponse =Bizcard.fromMap(dataObject);
      // Shared_Preferences().saveIntValue("CompanyId",dataObject["data"]["CompanyId"]);
      // Shared_Preferences().setStringValue("CompanyId", dataObject["data"]["CompanyId".toString()]);
      //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);



      /////////////////////////////////////



      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }
  Future<bool> CreateSocialCardAPi(
      Map<String,dynamic> param, BuildContext context) async
  {
    showProgressDialog();
    // progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    bool status = false;
    String finalURL = BASE_URL + CREATESOCIALCARD  ;
    print("finalURL " + finalURL);

    var url = Uri.parse(finalURL);

    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':" bearer ${Utils.access_token}",
        },
        body: jsonEncode(param));
    print("Request data " + finalURL + "body" + jsonEncode(param));
    print(HttpHeaders.acceptHeader);
    print(response.statusCode);
    print(jsonEncode(param));
    dismissDialog();
    var data = jsonDecode(response.body);
    print(jsonDecode(response.body));
    Map<String, dynamic> dataObject = jsonDecode(response.body);
    print(dataObject);

    if (response.statusCode == 200) {
      dismissDialog();
      // await progressDialog!.hide();
      Map<String, dynamic> dataObject = jsonDecode(response.body);
      print('success');
      print("Response data " + data.toString());
      print(dataObject.toString());
      // Utils.verfication=MobileVerfication.fromMap(dataObject);
      Utils.socialcardresponse =Socialcard.fromMap(dataObject);
      // Shared_Preferences().saveIntValue("CustomerId",dataObject["data"]["CustomerId"]);
      // Shared_Preferences().setStringValue("CompanyId", dataObject["data"]["CompanyId".toString()]);
      //   Utils.userData = LoginCredentials.fromJson(dataObject);

      // SharedPreference().setToken(dataObject["data"]['AccessToken'].toString());

      // SharedPreference().setLoggedIn(true);



      /////////////////////////////////////



      status = true;
    } else {
      var data = jsonDecode(response.body);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.white);
      status = false;
    }
    return status;
  }



  //////////////////Upload Image API/////////////////////////////////
  Future<bool> uploadCompanyLogo1(    var image,
      String filepath, String filename,int checkImageValue) async {
    Map<String, dynamic> queryParameter = {
      'companyID': Utils.CompanyIdPersonal.toString()
    };
    bool status = false;
    // bool status = true;
    String finalURL = BASE_URL + UPLOAD_PROFILE_PIC ;

    Uri uri = Uri.parse(finalURL);
    final finalUri = uri.replace(queryParameters: queryParameter);

     var headers = {
       'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,
      'Authorization': " bearer  ${Utils.access_token}",
      // 'Authorization': "bearer " + Utils.userData.data.AccessToken,
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,
    };
    var request = http.MultipartRequest('POST', finalUri);
    print(finalUri);
    request.headers.addAll(headers);
    Uint8List data = await image.readAsBytes();
    List<int> list = data.cast();
    request.files.add(http.MultipartFile.fromBytes("CompanyLogo", list,
        filename: filename));
    print(finalUri);
    // request.fields['id']="3";
    print("request sent");
    var response = await request.send();
    print("response sent"+response.statusCode.toString());
    print("response sent"+response.stream.toString());
    response.stream.bytesToString().asStream().listen((event) async {
      dismissDialog();
      var parsedJson = json.decode(event);
      print(parsedJson);
      // var responsebody=jsonDecode(parsedJson) as List;
      print('arshad');
      // print(responsebody);

      print(parsedJson);
      print(response.statusCode);
      if (response.statusCode == 200) {


       Utils.personalcompanylogo = parsedJson["ProfileImageUrl"].toString();
        // await progressDialog!.hide();
        print('dsflfdsfdskjfldgjfdg==================');
        // Utils.profile_picture=parsedJson["profile_picture_url"].toString();
      //  Utils.Companylogo= parsedJson["data"]["CompanyLogo"].toString();
        print(checkImageValue);

        print('arshad kpppppppppppp');
        Get.snackbar(AppName, "Profile Image Updated Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green
            ),
            colorText: Colors.black);

        status=true;
        // String message = parsedJson['message'].toString();
      } else {
        print('OOps something went worng');

      }
      //It's done...
    });
    return status;
  }
  Future<bool> uploadCompanyLogo2(    var image,
      String filepath, String filename,int checkImageValue) async {
    Map<String, dynamic> queryParameter = {
      'CompanyID': Utils.CompanyIdsocial.toString()
    };
    bool status = false;
    // bool status = true;
    String finalURL = BASE_URL + UPLOAD_PROFILE_PIC ;

    Uri uri = Uri.parse(finalURL);
    final finalUri = uri.replace(queryParameters: queryParameter);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,
      'Authorization': " bearer  ${Utils.access_token}",
      // 'Authorization': "bearer " + Utils.userData.data.AccessToken,
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,
    };
    var request = http.MultipartRequest('POST', finalUri);
    print(finalUri);
    request.headers.addAll(headers);
    Uint8List data = await image.readAsBytes();
    List<int> list = data.cast();
    request.files.add(http.MultipartFile.fromBytes("CompanyLogo", list,
        filename: filename));
    print(finalUri);
    // request.fields['id']="3";
    print("request sent");
    var response = await request.send();
    print("response sent"+response.statusCode.toString());
    print("response sent"+response.stream.toString());
    response.stream.bytesToString().asStream().listen((event) async {
      dismissDialog();
      var parsedJson = json.decode(event);
      print(parsedJson);
      // var responsebody=jsonDecode(parsedJson) as List;
      print('arshad');
      // print(responsebody);

      print(parsedJson);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // await progressDialog!.hide();
        print('dsflfdsfdskjfldgjfdg==================');
        // Utils.profile_picture=parsedJson["profile_picture_url"].toString();
        //  Utils.Companylogo= parsedJson["data"]["CompanyLogo"].toString();
        print(checkImageValue);

        print('arshad kpppppppppppp');
        Get.snackbar(AppName, "Profile Image Updated Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green
            ),
            colorText: Colors.black);

        status=true;
        // String message = parsedJson['message'].toString();
      } else {
        print('OOps something went worng');

      }
      //It's done...
    });
    return status;
  }
  Future<bool> uploadCompanyLogo3(    var image,
      String filepath, String filename,int checkImageValue) async {
    Map<String, dynamic> queryParameter = {
      'companyID': Utils.CompanyIdBiz
    };
    bool status = false;
    // bool status = true;
    String finalURL = BASE_URL + UPLOAD_PROFILE_PIC ;

    Uri uri = Uri.parse(finalURL);
    final finalUri = uri.replace(queryParameters: queryParameter);

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,
      'Authorization': " bearer  ${Utils.access_token}",
      // 'Authorization': "bearer " + Utils.userData.data.AccessToken,
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,
    };
    var request = http.MultipartRequest('POST', finalUri);
    print(finalUri);
    request.headers.addAll(headers);
    Uint8List data = await image.readAsBytes();
    List<int> list = data.cast();
    request.files.add(http.MultipartFile.fromBytes("CompanyLogo", list,
        filename: filename));
    print(finalUri);
    // request.fields['id']="3";
    print("request sent");
    var response = await request.send();
    print("response sent"+response.statusCode.toString());
    print("response sent"+response.stream.toString());
    response.stream.bytesToString().asStream().listen((event) async {
      dismissDialog();
      var parsedJson = json.decode(event);
      print(parsedJson);
      // var responsebody=jsonDecode(parsedJson) as List;
      print('arshad');
      // print(responsebody);

      print(parsedJson);
      print(response.statusCode);
      if (response.statusCode == 200) {
        // await progressDialog!.hide();
        print('////////////Done?////////');
        // Utils.profile_picture=parsedJson["profile_picture_url"].toString();
        //  Utils.Companylogo= parsedJson["data"]["CompanyLogo"].toString();
        print(checkImageValue);

        print('arshad kpppppppppppp');
        Get.snackbar(AppName, "Profile Image Updated Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green
            ),
            colorText: Colors.black);

        status=true;
        // String message = parsedJson['message'].toString();
      } else {
        print('OOps something went worng');

      }
      //It's done...
    });
    return status;
  }





///////////////// Get particular PRofile by Id API///////////////
  Future<bool> GetallprofilesbyIDPersonalApi() async {
    bool status = false;
    Map<String, String> queryParameter = {
      'companyID':Utils.CompanyIdPersonal.toString()
    };
    String finalURL = BASE_URL +GETPROFILEID;

    Uri uri = Uri.parse(finalURL);
    final finalUri = uri.replace(queryParameters: queryParameter);

    var response = await http.get(finalUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer ${Utils.access_token}",
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,

    },);

    // print("Request data "+ finalURL);
    print("${Utils.access_token}");
    print(response.statusCode);
    print(finalUri);
    print("${Utils.access_token}");
    dismissDialog();

    // print(dataobject);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print('success');
      print("Response data ${response.body}");
      dismissDialog();
      // String message = "Registered Successfully";

    //  Utils.getprofilesbyid= Getprofilesbyid.fromMap(dataobject);
      Map<String, dynamic> dataobject = jsonDecode(response.body);
      Utils.getprofilesbyid =Getprofilesbyid.fromMap(dataobject);

       // Utils.personalcompanylogo = dataobject["data"]["CompanyLogo"];
      // Utils.getprofiles =Getprofiles.fromMap(dataobject);
      //  Utils.loginresponse = Login.fromMap(dataobject);


      // Utils.profile_picture_person = dataobject["data"]["CustomerId"];
      // Utils.phone_number = dataobject["data"]["PhoneNo"];

      // final myUtils = Get.put(Utils());
      //
      // myUtils.showToastMessageBottom(message, context!);
      status = true;
    } else {
      var data = jsonDecode(response.body);
      print('OOps something went worng');
      print(data);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.red);
      status = false;
    }
    return status;


  }
  Future<bool> GetallprofilesbyIDSocialApi() async {
    bool status = false;
    Map<String, String> queryParameter = {
      'companyID': Utils.CompanyIdsocial.toString()
    };
    String finalURL = BASE_URL +GETPROFILEID;

    Uri uri = Uri.parse(finalURL);
    final finalUri = uri.replace(queryParameters: queryParameter);

    var response = await http.get(finalUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer ${Utils.access_token}",
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,

    },);

    // print("Request data "+ finalURL);
    print("${Utils.access_token}");
    print(response.statusCode);
    print(finalUri);
    print("${Utils.access_token}");
    dismissDialog();
    // Map<String, dynamic> dataobject = jsonDecode(response.body);

    // print(dataobject);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print('success');
      print("Response data ${response.body}");
      dismissDialog();
      // String message = "Registered Successfully";
      Map<String, dynamic> dataobject = jsonDecode(response.body);
    //  Utils.getprofilesbyid= Getprofilesbyid.fromMap(dataobject);
      Utils.getsocialprofilesbyid = GetSocialProfile.fromMap(dataobject);
      //  Utils.loginresponse = Login.fromMap(dataobject);


      // Utils.profile_picture_person = dataobject["data"]["CustomerId"];
      // Utils.phone_number = dataobject["data"]["PhoneNo"];

      // final myUtils = Get.put(Utils());
      //
      // myUtils.showToastMessageBottom(message, context!);
      status = true;
    } else {
      var data = jsonDecode(response.body);
      print('OOps something went worng');
      print(data);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.red);
      status = false;
    }
    return status;


  }
  Future<bool> GetallprofilesbyIDBizApi() async {
    bool status = false;
    Map<String, String> queryParameter = {
      'companyID': Utils.CompanyIdBiz.toString()
    };
    String finalURL = BASE_URL +GETPROFILEID;

    Uri uri = Uri.parse(finalURL);
    final finalUri = uri.replace(queryParameters: queryParameter);

    var response = await http.get(finalUri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer ${Utils.access_token}",
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,

    },);
    var request = http.Request('GET', finalUri);


    // print("Request data "+ finalURL);
    print("${Utils.access_token}");
    print(response.statusCode);
    print(finalUri);
    print("${Utils.access_token}");
    dismissDialog();
    // Map<String, dynamic> dataobject = jsonDecode(response.body);

    // print(dataobject);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print('success');
      print("Response data ${response.body}");
      dismissDialog();
      // String message = "Registered Successfully";
      Map<String, dynamic> dataobject = jsonDecode(response.body);
      // Utils.getprofilesbyid= Getprofilesbyid.fromMap(dataobject);
      //  Utils.loginresponse = Login.fromMap(dataobject);

   Utils.getbizprofilesbyid = GetBizProfile.fromMap(dataobject);
   // Utils.profile_picture_person = dataobject["data"]["CustomerId"];
      // Utils.phone_number = dataobject["data"]["PhoneNo"];

      // final myUtils = Get.put(Utils());
      //
      // myUtils.showToastMessageBottom(message, context!);
      status = true;
    } else {
      var data = jsonDecode(response.body);
      print('OOps something went worng');
      print(data);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.red);
      status = false;
    }
    return status;


  }

/////////Gett allll profiles///////////////////////
  Future<bool> GetallprofilesApi() async {
    // if(Utils.loginresponse.data!.accessToken ==""){
    //   return showProgessDialog();
    // }
    // progressDialog =ShowProgressDialog(context,type: ProgressDialogueType.Normal)
    bool status = false;
    String finalURL = BASE_URL +GETPROFILEAll;

    var url = Uri.parse(finalURL);
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "bearer ${Utils.access_token}",
      // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,

    },);

    // print("Request data "+ finalURL);
    print("${Utils.access_token}");
    print(response.statusCode);
    print(finalURL);
    print("${Utils.access_token}");
    dismissDialog();
    // Map<String, dynamic> dataobject = jsonDecode(response.body);

    // print(dataobject);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print('success');
      print("Response data ${response.body}");
      dismissDialog();
      // String message = "Registered Successfully";
      Map<String, dynamic> dataobject = jsonDecode(response.body);
      Utils.getprofiles= Getprofiles.fromMap(dataobject);
      //  List <dynamic> Sampleprofilelist = dataobject["data"];
      //
      // List<String>  myprofileList = Sampleprofilelist.map((i)=>i.toString()).toList();
      //
      // Shared_Preferences().saveList(myprofileList);

      // if(Utils.getprofiles.data != null){
      //   for(var i=0;i<Utils.getprofiles.data!.length;i++){
      //     if(Utils.getprofiles.data![i].profileType == "Profile Card"){
      //
      //       Shared_Preferences().setStringValue("CompanyId", dataobject["data"]["CompanyId".toString()]);
      //     }
      //   }
      // }
      // if(Utils.getprofiles.data != null){
      //   for(var i=0;i<Utils.getprofiles.data!.length;i++){
      //     if(Utils.getprofiles.data![i].profileType == "Biz Identity Card"){
      //
      //       Shared_Preferences().setStringValue("CompanyId", dataobject["data"]["CompanyId".toString()]);
      //     }
      //   }
      // }
      // if(Utils.getprofiles.data != null){
      //   for(var i=0;i<Utils.getprofiles.data!.length;i++){
      //     if(Utils.getprofiles.data![i].profileType == "Social Profile Card"){
      //
      //       Shared_Preferences().setStringValue("CompanyId", dataobject["data"]["CompanyId".toString()]);
      //     }
      //   }
      // }
     //
      //  Utils.loginresponse = Login.fromMap(dataobject);


      // Utils.profile_picture_person = dataobject["data"]["CustomerId"];
      // Utils.phone_number = dataobject["data"]["PhoneNo"];

      // final myUtils = Get.put(Utils());
      //
      // myUtils.showToastMessageBottom(message, context!);
      status = true;
    } else {
      var data = jsonDecode(response.body);
      print('OOps something went worng');
      print(data);
      dismissDialog();
      Get.snackbar(AppName, data['message'].toString(),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error, color: Colors.red),
          colorText: Colors.red);
      status = false;
    }
    return status;

  }
  //////////Get Card Price///////////////
  Future<bool> GetCardPriceApi() async {
    try {
      // if(Utils.loginresponse.data!.accessToken ==""){
      //   return showProgessDialog();
      // }
      // progressDialog =ShowProgressDialog(context,type: ProgressDialogueType.Normal)
      bool status = false;
      String finalURL = BASE_URL + GETCARDPRICE;

      var url = Uri.parse(finalURL);
      var response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "bearer ${Utils.access_token}",
        // 'Authorization': Utils.loginResponse.Token_Type + " " +Utils.loginResponse.Access_Token,

      },);

      // print("Request data "+ finalURL);
      print("${Utils.access_token}");
      print(response.statusCode);
      print(finalURL);
      print("${Utils.access_token}");
      dismissDialog();
      // Map<String, dynamic> dataobject = jsonDecode(response.body);

      // print(dataobject);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('success');
        print("Response data ${response.body}");
        dismissDialog();
        // String message = "Registered Successfully";
        Map<String, dynamic> dataobject = jsonDecode(response.body);
        Utils.getcardpriceresponse = GetCardprice.fromMap(dataobject);
        // Utils.getprofiles= Getprofiles.fromMap(dataobject);
        //  List <dynamic> Sampleprofilelist = dataobject["data"];
        //
        // List<String>  myprofileList = Sampleprofilelist.map((i)=>i.toString()).toList();
        //
        // Shared_Preferences().saveList(myprofileList);

        // myUtils.showToastMessageBottom(message, context!);
        status = true;
      } else {
        var data = jsonDecode(response.body);
        print('OOps something went worng');
        print(data);
        dismissDialog();
        Get.snackbar(AppName, data['message'].toString(),
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error, color: Colors.red),
            colorText: Colors.red);
        status = false;
      }
      return status;
    }catch(e){
      print(e);
    }
  }
}