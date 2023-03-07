import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';
import 'package:zeal_biz/Navigation/bottom_bar.dart';
import 'package:zeal_biz/widgets/sharedPreference.dart';

import '../Api_Service/API.dart';


class Otpverification extends StatefulWidget {
  var countrycode;

  var phhonenumber;



   Otpverification({Key? key,required this.countrycode,required this.phhonenumber}) : super(key: key);

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {


  @override
  void initState(){
    print('santhoooooosh');
    print(Utils.verfication.data!.customerId.toString());
    super.initState();
  }

  TextEditingController phhonenumbercontroller = TextEditingController();
  var countryCode= "+91";
  Future<void> invite(BuildContext context) async {

    var body = {
      "PhoneNo": widget.countrycode.toString() + widget.phhonenumber.toString()
      // "Variable": variableController.text.toString()
      // "password": "qqqq@123"
    };

    final changeUserPassword = Get.put(ApiService());
    var then = changeUserPassword.verficationApi(body,context).then((value) {

      if (value) {

        Navigator.push(context, CupertinoPageRoute(builder: (context)=> Otpverification(
          countrycode: countryCode.toString(),
          phhonenumber: phhonenumbercontroller.text.toString(),
        )));

      } else {


      }
    });
  }
  TextEditingController otpcontroller1=TextEditingController();
  TextEditingController otpcontroller2=TextEditingController();
  TextEditingController otpcontroller3=TextEditingController();
  TextEditingController otpcontroller4=TextEditingController();
 Future<void> Otp(BuildContext context) async {
    var otpnumber= otpcontroller1.text.toString() + otpcontroller2.text.toString() + otpcontroller3.text.toString() + otpcontroller4.text.toString();
     if(otpnumber==null){
       Get.snackbar(AppName, "Invalid OTP",
           snackPosition: SnackPosition.BOTTOM,
           icon: const Icon(Icons.error, color: Colors.red),
           colorText: Colors.white);
       return;
     }
    var body = {
      "CustomerId": Utils.verfication.data!.customerId.toString(),
      "OTP": otpcontroller1.text.toString() + otpcontroller2.text.toString() + otpcontroller3.text.toString() + otpcontroller4.text.toString()
    };

    final changeUserPassword = Get.put(ApiService());
    var then = changeUserPassword.Otpverfication(body,context).then((value) {


      if (value) {
        Get.to(() => Bottom());
        Get.snackbar(AppName, "Login Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green),
            colorText: Colors.white);
        print("hiiiiiiiii");

         return;
          
      } else {
        otpcontroller1.clear();
        otpcontroller2.clear();
        otpcontroller3.clear();
        otpcontroller4.clear();
        Get.snackbar(AppName ,"OTP VERFICATION FAILED",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error, color: Colors.red),
            colorText: Colors.white);
        return;
      }
      Future token = Shared_Preferences().getToken();
      token.then((data) async {
        Utils.access_token = data;
        // Utils.userData.data!.accessToken = data;
        print(Utils.access_token);
      });
      return;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/tech.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 200,
        ),
        body:  Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1, 0),
              end: Alignment.bottomRight,
              colors: [Color(0xff7558F8), Color(0xffF8588B)],
            ),
            image: DecorationImage(image: AssetImage('assets/images/tech.png'),fit: BoxFit.none,alignment: Alignment.topRight),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:EdgeInsetsDirectional.only(top: 146),
                      child: Text('Phone Verification',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.white),),
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:EdgeInsetsDirectional.only(top: 10),
                      child: Text('Enter your OTP Number',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 42,
                        child: Container(
                          child: TextFormField(
                            controller: otpcontroller1,
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                                foreground:Paint()..shader=LinearGradient(colors:<Color>[
                                  Color(0xff7558F8),
                                  Color(0xffF8588B),
                                ],
                                ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            onChanged: (value){
                              if (value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 42,
                        child: Container(
                          child: TextFormField(
                            controller: otpcontroller2,
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                                foreground:Paint()..shader=LinearGradient(colors:<Color>[
                                  Color(0xff7558F8),
                                  Color(0xffF8588B),
                                ],
                                ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            onChanged: (value){
                              if (value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 42,
                        child: Container(
                          child: TextFormField(
                            controller: otpcontroller3,
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                                foreground:Paint()..shader=LinearGradient(colors:<Color>[
                                  Color(0xff7558F8),
                                  Color(0xffF8588B),
                                ],
                                ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            onChanged: (value){
                              if (value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 42,
                        child: Container(
                          child: TextFormField(
                            controller: otpcontroller4,
                            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                                foreground:Paint()..shader=LinearGradient(colors:<Color>[
                                  Color(0xff7558F8),
                                  Color(0xffF8588B),
                                ],
                                ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            // onChanged: (value){
                            //   if (value.length==1){
                            //     FocusScope.of(context).nextFocus();
                            //   }
                            // },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 350),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't you received any code?",style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,color: Colors.white),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      invite(context);
                    }, child: Text('Resend',style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,color: Colors.black),)),
                    Text("a new code",style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,color: Colors.white),),
                  ],
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 50), //////// HERE
                    ),
                    onPressed: () {
                    Otp(context);
                    },
                    child: Text('Next',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
