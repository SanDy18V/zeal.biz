
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zeal_biz/scr/otp.dart';

import '../Api_Service/API.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController phhonenumbercontroller = TextEditingController();
 var countryCode= "+91";

 Future<void> invite(BuildContext context) async {
    var PhoneNumber=  phhonenumbercontroller.text.toString();
    bool isValidPhoneNumber(String? phhonenumbercontroller(value)) =>
        RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)').hasMatch(PhoneNumber);
       if(phhonenumbercontroller.text.isEmpty){
         Get.snackbar(AppName, "Invalid Mobile Number",
             snackPosition: SnackPosition.BOTTOM,
             icon: const Icon(Icons.error, color: Colors.red),
             colorText: Colors.white);
           return;
       }
       if (isValidPhoneNumber==false){
        Get.snackbar(AppName, "Invalid Mobile Number",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error, color: Colors.red),
            colorText: Colors.white);
         return;

       }
    var body = {
      "PhoneNo": countryCode.toString() + phhonenumbercontroller.text.toString()
      // "Variable": variableController.text.toString()
      // "password": "qqqq@123"
    };

    final changeUserPassword = Get.put(ApiService());
    var then = changeUserPassword.verficationApi(body,context).then((value) {

      if (value) {
        Get.snackbar(AppName, "You will recieve OTP",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green),
            colorText: Colors.white);
        Navigator.push(context, CupertinoPageRoute(builder: (context)=> Otpverification(
                countrycode: countryCode.toString(),
               phhonenumber: phhonenumbercontroller.text.toString(),
        )));
        return;
      } else {
           phhonenumbercontroller.clear();
      }
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
        body: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1, 0),
              end: Alignment.bottomRight,
              colors: [Color(0xff7558F8), Color(0xffF8588B)],
            ),
            image: DecorationImage(
                image: AssetImage('assets/images/tech.png'),
                fit: BoxFit.none,
                alignment: Alignment.topRight),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 146),
                      child: Text(
                        'Verify Your',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 10),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 10),
                      child: Text(
                        'Enter your Mobile Number',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 19,
                ),
                Container(
                  height: 55,
                  width: 364,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(5)),
                  child: SizedBox(
                    width: 100,
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        controller: phhonenumbercontroller,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              phhonenumbercontroller.clear();
                            },
                            icon: Icon(Icons.cancel_rounded),
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            //      margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    CountryCodePicker(
                                      onChanged: (CountryCode code) {
                                        print(code.dialCode.toString());
                                        countryCode =
                                            code.dialCode.toString();
                                        print('11111112222222222223333333333   $countryCode');
                                      },
                                      initialSelection: 'IN',
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      enabled: true,
                                      hideMainText: false,
                                      alignLeft: false,
                                      textStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 350,
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,

                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 50), //////// HERE
                    ),
                    onPressed: () {
                    invite(context);
                    },
                    child: Text(
                      'Next',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
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
