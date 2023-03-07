
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:zeal_biz/Api_Service/Utils.dart';


import 'package:zeal_biz/Navigation/bottom_bar.dart';
import 'package:zeal_biz/scr/Homescr.dart';
import 'package:zeal_biz/scr/View_profile_personal.dart';
import 'package:image_picker/image_picker.dart';
import '../Api_Service/API.dart';





enum ImageSourceType { gallery, camera }
class CreateProP extends StatefulWidget {
  // final List<Datum> profile;


  const CreateProP({Key? key, }) : super(key: key);

  @override
  State<CreateProP> createState() => _CreateProPState();
}

class _CreateProPState extends State<CreateProP> {
  @override
  void initState(){
    checkOnlineStatus();
    final updateProfilePicService = Get.put(ApiService());
    updateProfilePicService.showProgressDialog();
    var then = updateProfilePicService.GetallprofilesbyIDPersonalApi()
        .then((value) {
      if (value) {
        setState(() {});
        print('Finished');
        print(Utils.personalcompanylogo);
      } else {
        setState(() {});
      }
    });
  nameprofilecontroller.text = Utils.getprofilesbyid.data!.name ?? "";
  comnamecontroller.text= Utils.getprofilesbyid.data!.companyName ??"";
  designationprofilecontroller.text =Utils.getprofilesbyid.data!.designation ?? "";
  emailprofilecontroller.text = Utils.getprofilesbyid.data!.email ?? "";
  mobileprofilecontroller.text = Utils.getprofilesbyid.data!.mobileNo ?? "";
  addressprofilecontroller.text = Utils.getprofilesbyid.data!.address ??"";
  cityprofilecontroller.text = Utils.getprofilesbyid.data!.city ??"";
  stateprofilecontroller.text = Utils.getprofilesbyid.data!.state??"";
  zipprofilecontroller.text = Utils.getprofilesbyid.data!.zipcode ??"";
  websiteprofilecontroller.text = Utils.getprofilesbyid.data!.website ?? "";
  phonepayprofilecontroller.text = Utils.getprofilesbyid.data!.phonePe ?? "";
  paytmprofilecontroller.text= Utils.getprofilesbyid.data!.paytm ?? "";
  gpayprofilecontroller.text = Utils.getprofilesbyid.data!.googlePay ?? "";

    for (var i = 0; i < Utils.getprofilesbyid.data!.profileUrls!.length; i++) {
      if (Utils.getprofilesbyid.data!.profileUrls![i].socialMediaType ==
          "FACEBOOK") {
        fbprofilecontroller.text =
            Utils.getprofilesbyid.data!.profileUrls![i].userName ?? "";
      }
      else if (Utils.getprofilesbyid.data!.profileUrls![i].socialMediaType ==
          "LINKEDIN") {
        linkedinprofilecontroller.text =
            Utils.getprofilesbyid.data!.profileUrls![i].userName ?? "";
      }
      else if (Utils.getprofilesbyid.data!.profileUrls![i].socialMediaType ==
          "TWITTER") {
        tweetprofilecontroller.text =
            Utils.getprofilesbyid.data!.profileUrls![i].userName ?? "";
      }
      else if (Utils.getprofilesbyid.data!.profileUrls![i].socialMediaType ==
          "YOU TUBE") {
        youtubeprofilecontroller.text =
            Utils.getprofilesbyid.data!.profileUrls![i].userName ?? "";
      }
      else if (Utils.getprofilesbyid.data!.profileUrls![i].socialMediaType ==
          "INSTAGRAM") {
        instaprofilecontroller.text =
            Utils.getprofilesbyid.data!.profileUrls![i].userName ?? "";
      }
      else if (Utils.getprofilesbyid.data!.profileUrls![i].socialMediaType ==
          "WHATSAPP") {
        whatsappprofilecontroller.text =
            Utils.getprofilesbyid.data!.profileUrls![i].userName ?? "";
      }
    }
print(Utils.personalcompanylogo);

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
TextEditingController websiteprofilecontroller=TextEditingController();
TextEditingController fbprofilecontroller=TextEditingController();
TextEditingController linkedinprofilecontroller=TextEditingController();
TextEditingController tweetprofilecontroller=TextEditingController();
TextEditingController youtubeprofilecontroller=TextEditingController();
TextEditingController instaprofilecontroller=TextEditingController();
TextEditingController whatsappprofilecontroller=TextEditingController();
TextEditingController phonepayprofilecontroller=TextEditingController();
TextEditingController paytmprofilecontroller=TextEditingController();
TextEditingController gpayprofilecontroller=TextEditingController();
bool imageUploadCheck =false;
XFile? image;

var abc;

//ProgressDialog? progressDialog;


  Future<void> _handleURLButtonPressTwo(BuildContext context, var type) async {
    var imagePicker = ImagePicker();
    var source = type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;

    image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);

    setState(() {
      Get.back();
      print("file path " + image!.path);
      //----- _image = File(data.path);
   //   _imageTwo = File(image!.path);
      imageUploadCheck = true;
      // imageNewUpload = _image.readAsBytesSync();
      // _imageUpload = image.path;
      // _imagePet = base64Encode(_image.readAsBytesSync());
      // print(_imagePet);
      // _imageUploadName = image.name;
      // _image = image.path;
      print('arshad check image');
      // uploadImgController.text = image.name;
      int checkImageValue = 1;
      _uploadImages(context, image, image!.name, image!.path, checkImageValue);
      // showLoader();
    });
  }

  Future<void> _uploadImages(BuildContext context, var image, String name,
      String path, int checkImageValue) async {
    final updateProfilePicService = Get.put(ApiService());
    updateProfilePicService.showProgressDialog();
    updateProfilePicService
        .uploadCompanyLogo1(image, path, name, checkImageValue)
        .then((value) {
      if (value) {
        setState(() {

        });

        // Get.to(EmailVerification());
      } else {
        setState(() {});
      }
    });
  }


  Future<void> profilecard(BuildContext context) async {



    var body = {
      "CompanyId":Utils.CompanyIdPersonal ,
      "ProfileTypeId": "1".toString(),
      "Name": nameprofilecontroller.text.toString(),
      "Designation": designationprofilecontroller.text.toString(),
      "Email": emailprofilecontroller.text.toString().toLowerCase(),
      "MobileNo": mobileprofilecontroller.text.toString(),
      "CompanyName": comnamecontroller.text.toString(),
      "Address": addressprofilecontroller.text.toString(),
      "City": cityprofilecontroller.text.toString(),
      "Website":websiteprofilecontroller.text.toString(),
      "State": stateprofilecontroller.text.toString(),
      "Zipcode": zipprofilecontroller.text.toString(),
     "Country": countryprofilecontroller.text.toString(),
      "Paytm": paytmprofilecontroller.text.toString() ,
      "PhonePe": phonepayprofilecontroller.text.toString() ,
      "GooglePay": gpayprofilecontroller.text.toString() ,
     "ProfileUrls": []


    };



    final profilecard = Get.put(ApiService());
    var then = profilecard.ProfileCardAPi(body,context).then((value) {

      if (value) {
        Get.snackbar(AppName, "Profile Updated Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green),
            colorText: Colors.white);
        Navigator.push(context, CupertinoPageRoute(builder: (context)=> PerCard()));
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
          leading:IconButton(
            onPressed: (){
               Navigator.push(context, CupertinoPageRoute(builder: (context)=>PerCard()));
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
          title: Text(" Edit Profile card",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [

                CircleAvatar(
                  backgroundColor:  Color(0xffF1F2F6),
                       backgroundImage:   Utils.getprofilesbyid.data!.companyLogo != null? NetworkImage(Utils.getprofilesbyid.data!.companyLogo!): NetworkImage("https://www.nicepng.com/png/detail/357-3576881_a-lot-more-fluid-in-camera-blue-icon.png"),
                       // backgroundImage: AssetImage(Utils.personalcompanylogo.toString(),),
                      // child: Image.asset("assets/ico/cam.png",height: 35,width: 45,) ,
                  //     backgroundImage:AssetImage("assets/ico/cam.png"),
                  // image == null
                  //     ?
                  // NetworkImage(widget.profile!.companyLogo!.toString()),
                  //
                  //     : FileImage(
                  //   File(image!.path),
                  // ),

                  radius: 60,
                ),
                Positioned(right: 3,
                  bottom: 2,child: GestureDetector(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/ico/plus.png",height: 12,width: 12,),
                  ),
                  onTap: (){
                  Get.defaultDialog(
                    title: "Zeal.Biz",
                      titleStyle: TextStyle(fontSize: 20),
                    middleText: "Please select",
                    middleTextStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.white,
                    radius:10,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: (){
                              _handleURLButtonPressTwo(context, ImageSourceType.gallery);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.photo),
                                Text("Gallery"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: (){
                              _handleURLButtonPressTwo(context, ImageSourceType.camera);
                             // _handleURLButtonPressed(context,ImageSourceType.camera);
                            },
                            child: Column(
                              children: [
                                Icon(Icons.camera_alt),
                                Text("Camera"),
                              ],
                            ),
                          ),

                        )
                      ],
                    ),
                  );
                  },
                ),
                )
              ],
            ),

            SizedBox(height: 10,),
            Text("Upload Image"
            ),
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
                  Text("Website",style: TextStyle(
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
                      controller: websiteprofilecontroller,
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
                          image:AssetImage("assets/ico/phonepay.png"),
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


