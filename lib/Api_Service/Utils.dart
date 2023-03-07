
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:zeal_biz/Modules/Activate_trail_response.dart';
import 'package:zeal_biz/Modules/GetCatagory.dart';
import 'package:zeal_biz/Modules/Getallprofiles.dart';
import 'package:zeal_biz/Modules/RegisterBizResponse.dart';
import 'package:zeal_biz/Modules/ReisterProfileResponse.dart';
import 'package:zeal_biz/Modules/getprofilesbyid Personal.dart';
import 'package:zeal_biz/Modules/personpicupload.dart';
import 'package:zeal_biz/Modules/verificatiion_response.dart';

import '../Modules/GetCardprice_Response.dart';
import '../Modules/OTP_Response.dart';
import '../Modules/RegisterSocialResponse.dart';
import '../Modules/getprofilesbyid Social.dart';
import '../Modules/getprofilesbyidbiz.dart';

import 'API.dart';

class Utils{
  static MobileVerfication verfication = MobileVerfication();
  static Otp otpResponse= Otp();

//Get all Profiles
  static  Getprofiles getprofiles  = Getprofiles();
  static Personalpicupload personalpicuploadresponse = Personalpicupload();
  //get particular profile by Company Id

  static Getprofilesbyid getprofilesbyid = Getprofilesbyid();
  static  GetSocialProfile getsocialprofilesbyid =GetSocialProfile();
  static GetBizProfile getbizprofilesbyid = GetBizProfile();

///// Register Profile first time to get Company Id

  static Profilecard  profileCardresponse=Profilecard();
  static Bizcard bizcardresponse = Bizcard();
  static  Socialcard socialcardresponse = Socialcard();

 /////////////////////////////////////////////////////////////
  static Getcategory getcategoryresponse = Getcategory();
 static  GetCardprice getcardpriceresponse =GetCardprice();
 static Activatetrail activatetrailresponse = Activatetrail();



////// ID & Acc token
  static String access_token = "";
  static  int CompanyIdPersonal = 0;
  List<int> list = [CompanyIdPersonal];
  static int CompanyIdsocial = 0 ;
  static  int CompanyIdBiz= 0;
  static   String CustomerId = "";


////////////////////




static List< Datum >? allprofile =[];









 static String personalcompanylogo ="";


  showInvaliedtoastMessge(String message){
    Get.snackbar(AppName, message ,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(Icons.error, color: Colors.red),
        backgroundColor: Colors.white,
        colorText: Colors.black);
  }



}
