import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'package:zeal_biz/Navigation/bottom_bar.dart';
import 'package:zeal_biz/scr/Homescr.dart';
import 'package:zeal_biz/scr/Onboard1.dart';
import 'package:zeal_biz/scr/Verification.dart';
import 'package:zeal_biz/widgets/sharedPreference.dart';

import '../Api_Service/Utils.dart';




class MyHomePage extends StatefulWidget {

  const MyHomePage({Key?key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future checkFirstSeen() async {

    await Future.delayed(Duration(seconds: 3));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      final userLoggedIn = await Shared_Preferences().getLogedIn();
      if(userLoggedIn == null || userLoggedIn == false){
        // Get.offAll(LoginPage());
        Get.offAll(()=>Verify());
      }else{
        // Get.offAll(MyHomePage());
        Get.offAll(()=>Bottom());
        Future token = Shared_Preferences().getToken();
        token.then((data) async {
          Utils.access_token = data;
          //Utils.userData.data!.accessToken = data;
          print(data);
        });
      }
    } else {
      await prefs.setBool('seen', true);
      // Get.offAll(()=>Onbording());
      Get.offAll(()=>Onborded());
    }
  }



  @override
  void initState() {
    checkFirstSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(body:

    Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1, 0),
          end: Alignment.bottomRight,
          colors: [Color(0xff7558F8), Color(0xffF8588B)],
        ),
        image: DecorationImage(image: AssetImage('assets/images/tech.png'),
            fit: BoxFit.none,
            alignment: Alignment.topRight),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.fromSTEB(0, 350, 0, 0),
            child: Center(
              child: Image.asset("assets/images/Layer 2.png", height: 60,),
            ),

          ),
          SizedBox(
            height: 300,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("©2021 Copyright Reserved By Zeal.biz",
                  style: TextStyle(color: Colors.white),)
              ],
            ),
          )
        ],

      ),
    ),
    );
  }

//
  @override
  void dispose() {

    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  Future<void> checkUserLoggedIn() async{
   // final _sharedPref = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));
    final userLoggedIn = await Shared_Preferences().getLogedIn();
    if(userLoggedIn == null || userLoggedIn == false){
      Get.offAll(Onborded());
    }else{
      Get.offAll(Dashboard());
      Future token = Shared_Preferences().getToken();
      token.then((data) async {
        Utils.access_token = data;

        //Utils.userData.data!.accessToken = data;
        print(data);
      });
    }
  }

}
