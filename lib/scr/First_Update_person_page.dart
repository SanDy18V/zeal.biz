
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';

import 'package:zeal_biz/widgets/sharedPreference.dart';
import '../Api_Service/API.dart';

import '../Navigation/bottom_bar.dart';





class FirstUpdateProfilePage extends StatefulWidget {
  // final List<Datum> profile;


  const FirstUpdateProfilePage({Key? key,}) : super(key: key);


  @override
  State<FirstUpdateProfilePage> createState() => _FirstUpdateProfilePageState();
}

class _FirstUpdateProfilePageState extends State<FirstUpdateProfilePage> {
  @override
  void initState() {
    Future CustomerId = Shared_Preferences().getIntValue();
    CustomerId.then((data) async{
      Utils.CustomerId=data;
      print(data);
    });

    super.initState();

  }

  TextEditingController nameprofilecontroller=TextEditingController();
  TextEditingController comnamecontroller=TextEditingController();
  TextEditingController designationprofilecontroller=TextEditingController();
  TextEditingController emailprofilecontroller=TextEditingController();
  TextEditingController mobileprofilecontroller=TextEditingController();
  TextEditingController addressprofilecontroller=TextEditingController();
  TextEditingController cityprofilecontroller=TextEditingController();
 TextEditingController countryprofilecontroller=TextEditingController();
  TextEditingController stateprofilecontroller=TextEditingController();
  TextEditingController zipprofilecontroller=TextEditingController();
   // TextEditingController profilecontroller=TextEditingController();
  TextEditingController fbprofilecontroller=TextEditingController();
  TextEditingController linkedinprofilecontroller=TextEditingController();
  TextEditingController tweetprofilecontroller=TextEditingController();
  TextEditingController youtubeprofilecontroller=TextEditingController();
  TextEditingController instaprofilecontroller=TextEditingController();
  TextEditingController whatsappprofilecontroller=TextEditingController();
  TextEditingController phonepayprofilecontroller=TextEditingController();
  TextEditingController paytmprofilecontroller=TextEditingController();
  TextEditingController gpayprofilecontroller=TextEditingController();


  Future<void> profilecard(BuildContext context) async {
    var email = emailprofilecontroller.text.toString().trim();
    bool emailValid =RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
final MyUtils = Get.put(Utils());
if(nameprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter your Name");
}
if(designationprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter your Designation");
}
if(mobileprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter Your MobileNo");
}
if(comnamecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter Your CompanyName");
}
if(addressprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter Your Address");
}
if(cityprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter your City");
}
if(stateprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter Your State");
}
if(zipprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter Your ZipCopde");
}
if(countryprofilecontroller.text.isEmpty){
  MyUtils.showInvaliedtoastMessge("Enter Your Country");
}
    var body = {

     // "CustomerId": Utils.CustomerId,
      "ProfileTypeId": 1,
      "CompanyId":0,
      // "ProfileType":"Profile Card".toString(),
      "Name": nameprofilecontroller.text.toString(),
      "Designation": designationprofilecontroller.text.toString(),
      "Email": emailprofilecontroller.text.toString().toLowerCase(),
      "MobileNo": mobileprofilecontroller.text.toString(),
      "CompanyName": comnamecontroller.text.toString(),
      "Address": addressprofilecontroller.text.toString(),
      "City": cityprofilecontroller.text.toString(),
      "State": stateprofilecontroller.text.toString(),
      "Zipcode": zipprofilecontroller.text.toString(),
       "Country": countryprofilecontroller.text.toString(),
      "Paytm": paytmprofilecontroller.text.toString() + "@paytm".toString(),
      "PhonePe": phonepayprofilecontroller.text.toString() +"@PhonePe".toString(),
      "GooglePay": gpayprofilecontroller.text.toString() + "@GooglePay".toString(),
      "ProfileUrls":[],

    };

    final CreateProfileCard = Get.put(ApiService());
    var then = CreateProfileCard.CreateProfileCardAPi(body,context).then((value) {


      if (value) {
        Get.snackbar(AppName, "Profile Created Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green),
            colorText: Colors.white);
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>Bottom()));
        return;
      }
      else{
        Get.snackbar(AppName, "Invalid Details",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error, color: Colors.red
            ),
            colorText: Colors.white);
        return;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:Container(
            child: IconButton(
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>Bottom()));
              },
              icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            ),
          ),
          title: Text("Create Profile card",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: const [
                  Text("Name",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: nameprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Company Name",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: comnamecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Designation",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: designationprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Email",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: emailprofilecontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Mobile",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: mobileprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Address",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: addressprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("City",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: cityprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("State",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: stateprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: Row(
            //     children: [
            //       Text("Country",style: TextStyle(
            //           fontWeight: FontWeight.bold,fontSize: 16
            //       ),)
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 25,right: 26),
            //   child: Container(
            //     height: 50,
            //     width: 364,
            //     decoration: BoxDecoration(
            //         color: Color(0xffF1F2F6),
            //         borderRadius: BorderRadius.circular(10)
            //     ),
            //     child: SizedBox(
            //       width: 364,
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 25),
            //         child: TextFormField(
            //           controller: countryprofilecontroller,
            //           keyboardType: TextInputType.text,
            //           decoration: InputDecoration(
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Zip Code",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: zipprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Country",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 26),
              child: Container(
                height: 50,
                width: 364,
                decoration: BoxDecoration(
                    color: Color(0xffF1F2F6),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SizedBox(
                  width: 364,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      controller: countryprofilecontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Social Media Links",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/FB.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: fbprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/FB.png",height: 100,width: 100,)),
                ),
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/IN.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: linkedinprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/IN.png",height: 100,width: 100,)),
                ),
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/TWIT.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: tweetprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/TWIT.png",height: 100,width: 100,)),
                ),
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/youtube.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: youtubeprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/youtube.png",height: 100,width: 100,)),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/Insta.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: instaprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/Insta.png",height: 100,width: 100,)),
                ),
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/WAPP.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: whatsappprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);

                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/WAPP.png",height: 100,width: 100,)),
                ),

              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Add Payments",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/phonepay.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller:phonepayprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);

                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/phonepay.png",height: 100,width: 100,)),
                ),
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/paytm.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: paytmprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);

                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/paytm.png",height: 100,width: 100,)),
                ),
                SizedBox(width: 25,),
                Container(
                  child: IconButton(onPressed: (){
                    showModalBottomSheet<void>(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0))),
                        isScrollControlled: true,
                        context: context,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        builder: (context){
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () {Navigator.pop(context);},
                                                  child: Icon(Icons.close, size: 26,)),
                                              Text("ADD LINK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                                              SizedBox(width: 5,)
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Enter User Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                          SizedBox(height: 30,),
                                          Container(

                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              boxShadow: const [
                                                // to make elevation
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 4,
                                                ),],
                                              border: Border.all(color: Colors.white, width: 5.0,),
                                              image: DecorationImage(colorFilter: ColorFilter.mode(
                                                  Colors.white, BlendMode.dstATop),
                                                image: AssetImage("assets/ico/phonepay.png"),
                                                // image: NetworkImage(Utils.paylist_image[index]),
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                          SizedBox(height: 30,),
                                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom * 0.65),
                                              child: Padding(
                                                // padding: EdgeInsets.all(MediaQuery.of(context).size.width/10),
                                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                                  child: Container(
                                                      height: 250,
                                                      // color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Name",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(

                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 15,),
                                                          Row(
                                                            children: const [
                                                              SizedBox(width: 35,),
                                                              Text("Link",style: TextStyle(color: Colors.black,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold),)
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 25,right: 26),
                                                            child: Container(
                                                              height: 50,
                                                              width: 364,
                                                              decoration: BoxDecoration(
                                                                  color: Color(0xffF1F2F6),
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: SizedBox(
                                                                width: 364,
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 25),
                                                                  child: TextFormField(
                                                                    controller: gpayprofilecontroller,
                                                                    keyboardType: TextInputType.text,
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 20,),
                                                          GestureDetector(
                                                            onTap: (){
                                                              Navigator.pop(context);

                                                            },
                                                            child: Container(
                                                              height: 48,
                                                              width: 264,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),
                                                                gradient: LinearGradient(
                                                                  colors: [Color(0xff7558F8), Color(0xffF8588B)],
                                                                ),
                                                              ),
                                                              child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                        ],
                                                      )
                                                  )
                                              )
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                      icon: Image.asset("assets/ico/gpay.png",height: 100,width: 100,)),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    Get.off(Bottom());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Image.asset("assets/ico/cancel.png",height: 12,width: 12,),
                  ),
                ),
                SizedBox(width: 20,),

                GestureDetector(
                  onTap: (){
                    profilecard(context);
                  },
                  child: Container(
                    height: 48,
                    width: 264,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [Color(0xff7558F8), Color(0xffF8588B)],
                      ),
                    ),
                    child: Center(child: Text("Finish",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }

}


