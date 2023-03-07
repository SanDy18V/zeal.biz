import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';
import 'package:zeal_biz/scr/View_Biz.dart';

import '../Api_Service/API.dart';

enum ImageSourceType { gallery, camera }
class CreateBiz extends StatefulWidget {

  const CreateBiz({Key? key}) : super(key: key);

  @override
  State<CreateBiz> createState() => _CreateBizState();
}

class _CreateBizState extends State<CreateBiz> {
  @override
  void initState() {

    final updateProfilePicService = Get.put(ApiService());
    updateProfilePicService.showProgressDialog();
    var then = updateProfilePicService.GetallprofilesbyIDBizApi()
        .then((value) {
      if (value) {
        setState(() {});
        print('Finished');

      } else {
        setState(() {});
      }
    });
   nameBizcontroller.text = Utils.getbizprofilesbyid.data!.name ?? "";
    gstcontroller.text = Utils.getbizprofilesbyid.data!.gstNo ??"";

    emailcontroller.text = Utils.getbizprofilesbyid.data!.email ?? "";
    pernumbercontroller.text = Utils.getbizprofilesbyid.data!.phoneNo ?? "";
    contactpersoncontroller.text = Utils.getbizprofilesbyid.data!.contactPerson ?? "";
    websitecontroller.text = Utils.getbizprofilesbyid.data!.website ?? "";
    addresscontroller.text = Utils.getbizprofilesbyid.data!.address ?? "";
    citycontroller.text = Utils.getbizprofilesbyid.data!.city ?? "";
    statecontroller.text = Utils.getbizprofilesbyid.data!.state ?? "";
    zipcontroller.text = Utils.getbizprofilesbyid.data!.zipcode ?? "";
    phonepaycontroller.text = Utils.getbizprofilesbyid.data!.phonePe ?? "";
    gpaycontroller.text = Utils.getbizprofilesbyid.data!.googlePay ?? "";
    paytmcontroller.text = Utils.getbizprofilesbyid.data!.paytm ??"";
    reviewcontroller.text = Utils.getbizprofilesbyid.data!.googleReviewLink ??"";
    // TODO: implement initState
    super.initState();
  }
  final nameBizcontroller=TextEditingController();
  final gstcontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final contactpersonnumber=TextEditingController();
  final contactpersoncontroller=TextEditingController();
  final pernumbercontroller=TextEditingController();
  final addresscontroller=TextEditingController();
  final citycontroller=TextEditingController();
  final statecontroller=TextEditingController();
  final zipcontroller=TextEditingController();
  final websitecontroller=TextEditingController();
  final reviewcontroller=TextEditingController();
  final fbcontroller=TextEditingController();
  final linkedincontroller=TextEditingController();
  final tweetcontroller=TextEditingController();
  final youtubecontroller=TextEditingController();
  final instacontroller=TextEditingController();
  final whatsappcontroller=TextEditingController();
  final phonepaycontroller=TextEditingController();
  final paytmcontroller=TextEditingController();
  final gpaycontroller=TextEditingController();
  final productcontroller=TextEditingController();


  Future<void> bizcardapi(BuildContext context) async {

    var body = {

        "CompanyId": Utils.CompanyIdBiz, //0 If new profile else enter CompanyId
        "ProfileTypeId": "2",
        "Name": nameBizcontroller.text.toString(),
        "GSTNo": gstcontroller.text.toString(),
        "PhoneNo":pernumbercontroller.text.toString(),
        "ContactPerson": contactpersoncontroller.text.toString() ,
        "ContactPersonPhoneNo": contactpersonnumber.text.toString(),
        "Email": emailcontroller.text.toString(),
        "Website": websitecontroller.text.toString(),
        "Address": addresscontroller.text.toString(),
        "City": citycontroller.text.toString(),
        "State": statecontroller.text.toString(),
        "Country": "India",
        "ZipCode": zipcontroller.text.toString(),
        "GoogleReviewLink":reviewcontroller.text.toString(),
        "Paytm": paytmcontroller.text.toString(),
        "PhonePe": phonepaycontroller.text.toString(),
        "GooglePay": gpaycontroller.text.toString(),
        "ProfileUrls": [],
        "Services": []

    };

    final bizcard = Get.put(ApiService());
    var then = bizcard.ProfileCardAPi(body,context).then((value) {

      if (value) {
        Get.snackbar(AppName, "Profile Updated Successfully",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done, color: Colors.green),
            colorText: Colors.white);
        Navigator.push(context, CupertinoPageRoute(builder: (context)=> Bizcard()));
        return;
      }else{
        Get.snackbar(AppName, "Invalid Details",
            snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.error
                , color: Colors.red),
            colorText: Colors.white);
        return;
      }
    });
  }






  bool imageUploadCheck =false;
  XFile? image;
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
      int checkImageValue = 2;
      _uploadImages(context, image, image!.name, image!.path, checkImageValue);
      // showLoader();
    });
  }

  Future<void> _uploadImages(BuildContext context, var image, String name,
      String path, int checkImageValue) async {
    final updateProfilePicService = Get.put(ApiService());
    updateProfilePicService.showProgressDialog();
    updateProfilePicService
        .uploadCompanyLogo3(image, path, name, checkImageValue)
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:IconButton(
            onPressed: (){
             Navigator.push(context, CupertinoPageRoute(builder: (context)=>Bizcard()));
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
          title: Text("Edit Biz card",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor:  Color(0xffF1F2F6),
                  backgroundImage:  Utils.getbizprofilesbyid.data!.companyLogo != null ? NetworkImage(Utils.getbizprofilesbyid.data!.companyLogo):NetworkImage("https://www.nicepng.com/png/detail/357-3576881_a-lot-more-fluid-in-camera-blue-icon.png"),
                  // backgroundImage: image == null
                  //     ? null
                  //     : FileImage(
                  //   File(image!.path),
                  // ),
                  // child: Image.asset("assets/ico/cam.png",height: 35,width: 45,),
                  radius: 60,
                ),
                Positioned(child: GestureDetector(
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
                                //  var imageurl = Util
                                //    _handleURLButtonPressed(
                                //      context, ImageSourceType.gallery);
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
                  right: 3,
                  bottom: 2,
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
                children: [
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
                      controller: nameBizcontroller,
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
            //           keyboardType: TextInputType.text,
            //           decoration: InputDecoration(
            //             border: InputBorder.none,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("GST NO",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
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
                      controller: gstcontroller,
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
                      controller: emailcontroller,
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
                  Text("Contact Person Number",style: TextStyle(
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
                      controller: contactpersonnumber,
                      keyboardType: TextInputType.number,
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
                  Text("Contact Person",style: TextStyle(
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
                      controller:contactpersoncontroller,
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
            //       Text("Personal Number",style: TextStyle(
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
            //           controller: pernumbercontroller,
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
                      controller:addresscontroller,
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
                      controller: citycontroller,
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
                      controller: statecontroller,
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
                      controller: zipcontroller,
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
                      controller: websitecontroller,
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
                  Text("Google Review Link",style: TextStyle(
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
                      controller: reviewcontroller,
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
                                                                   controller: fbcontroller,
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
                                                                   controller: linkedincontroller,
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
                                                                   controller: tweetcontroller,
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
                                                                    controller: youtubecontroller,
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
                                                                   controller: instacontroller,
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
                                                                    controller: whatsappcontroller,
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
                                                                   controller: phonepaycontroller,
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
                                                                    controller: paytmcontroller,
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
                                                image: AssetImage("assets/ico/gpay.pn"),
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
                                                                  controller: gpaycontroller,
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
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("ADD PRODUCT",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16
                  ),),
                ),
                SizedBox(width: 25,),
                InkWell(
                  onTap:(){
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
                                                image: AssetImage("assets/ico/gpay.pn"),
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
                                                                    controller: productcontroller,
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
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/ico/plus.png",height: 12,width: 12,),),
                )
              ],
            ),
            SizedBox(height: 50,),
            Container(
              height: 188,

              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 134,
                    height: 188,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18,),
                          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8gmPdKDAHm4n3PwlK4sL6TlaVqL9uK6CtQ&usqp=CAU"),
                            height: 60,width: 57,),
                          SizedBox(height: 10,),
                          Text("Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 10,),
                          Text("Achieve your health \ngoals by tracking your vitals"),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,size:12 ,),
                              Text("5000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 134,
                    height: 188,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18,),
                          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8gmPdKDAHm4n3PwlK4sL6TlaVqL9uK6CtQ&usqp=CAU"),
                            height: 60,width: 57,),
                          SizedBox(height: 10,),
                          Text("Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 10,),
                          Text("Achieve your health \ngoals by tracking your vitals"),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,size:12 ,),
                              Text("5000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width:20,),
                  Container(
                    width: 134,
                    height: 188,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18,),
                          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8gmPdKDAHm4n3PwlK4sL6TlaVqL9uK6CtQ&usqp=CAU"),
                            height: 60,width: 57,),
                          SizedBox(height: 10,),
                          Text("Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 10,),
                          Text("Achieve your health \ngoals by tracking your vitals"),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,size:12 ,),
                              Text("5000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 134,
                    height: 188,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18,),
                          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8gmPdKDAHm4n3PwlK4sL6TlaVqL9uK6CtQ&usqp=CAU"),
                            height: 60,width: 57,),
                          SizedBox(height: 10,),
                          Text("Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 10,),
                          Text("Achieve your health \ngoals by tracking your vitals"),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,size:12 ,),
                              Text("5000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 134,
                    height: 188,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18,),
                          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8gmPdKDAHm4n3PwlK4sL6TlaVqL9uK6CtQ&usqp=CAU"),
                            height: 60,width: 57,),
                          SizedBox(height: 10,),
                          Text("Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 10,),
                          Text("Achieve your health \ngoals by tracking your vitals"),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,size:12 ,),
                              Text("5000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 134,
                    height: 188,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18,),
                          Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN8gmPdKDAHm4n3PwlK4sL6TlaVqL9uK6CtQ&usqp=CAU"),
                            height: 60,width: 57,),
                          SizedBox(height: 10,),
                          Text("Watch",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                          SizedBox(height: 10,),
                          Text("Achieve your health \ngoals by tracking your vitals"),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee,size:12 ,),
                              Text("5000",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 75,),

            Row(
              children: [
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Image.asset("assets/ico/cancel.png",height: 12,width: 12,),
                  ),
                ),
                SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    bizcardapi(context);
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
                //  IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined,color: Colors.blue,))
              ],
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
