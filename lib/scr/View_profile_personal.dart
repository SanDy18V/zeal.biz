
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';

import 'package:zeal_biz/Navigation/bottom_bar.dart';
import 'package:zeal_biz/scr/Edit_per.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Api_Service/API.dart';


import 'Buy Card.dart';
class PerCard extends StatefulWidget {

  PerCard({Key? key,}) : super(key: key);

  @override
  State<PerCard> createState() => _PerCardState();
}

class _PerCardState extends State<PerCard> {

  @override
  void initState(){
    final updateProfilePicService = Get.put(ApiService());
    updateProfilePicService.showProgressDialog();
    var then = updateProfilePicService.GetallprofilesbyIDPersonalApi()
        .then((value) {
     if (value) {
        setState(() {});
        print('Finished');
      } else {
        setState(() {});
      }
    });


    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1, 0),
          end: Alignment.bottomRight,
          colors: [Color(0xff7558F8), Color(0xffF8588B)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // toolbarHeight: 70,
          leading:IconButton(
            onPressed: (){
             Navigator.push(context, CupertinoPageRoute(builder: (context)=>Bottom()));
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              Text('Personal Card',style: TextStyle(fontWeight: FontWeight.w700,
                  color: Colors.white,fontSize: 20),),
            ],
          ),

          actions: [
            IconButton(onPressed: ()async{
               showAlertDialogQR(context);
            }, icon:Image.asset('assets/ico/Scan.png',height: 40,width: 40,)),
            IconButton (onPressed: (){
           Navigator.push(context, CupertinoPageRoute(builder:(context)=>CreateProP()));
            }, icon:Image.asset('assets/ico/Edit.png',height: 40,width: 40,))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, 0),
                end: Alignment.bottomRight,
                colors: [Color(0xff7558F8), Color(0xffF8588B)],
              ),
              image: DecorationImage(image: AssetImage('assets/images/tech.png'),
                  fit: BoxFit.none,alignment: Alignment.topRight),
            ),
            child: Column(
              children: [
                Container(
                  // height: 800,
                  width: 364,
                  // margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),

                      Container(
                        height: 150,
                        width: 150,
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
                            // image: AssetImage("assets/ico/FB.png"),
                            image:  Utils.getprofilesbyid.data!.companyLogo != null? NetworkImage(Utils.getprofilesbyid.data!.companyLogo!):NetworkImage("https://media.istockphoto.com/id/588258370/vector/male-avatar-profile-picture-vector.jpg?s=612x612&w=is&k=20&c=0GzYn9VEBuybNQyjd4n5-IU_i06drUgiubUwc-K1vsk="),
                            // image: NetworkImage(Utils.paylist_image[index]),
                            fit: BoxFit.cover,),
                        ),
                      ),

                      SizedBox(height: 8,),
                       Text(
                   Utils.getprofilesbyid.data!.userName != null || Utils.getprofilesbyid.data!.userName != null?
                       Utils.getprofilesbyid.data!.userName! :"Name",
                        // widget.profile!.name != null || widget.profile!.name != null?
                        // widget.profile!.name! : 'Name',
                          style:TextStyle(fontSize:30,fontWeight:FontWeight.w700 ,
                          foreground:Paint()..shader=LinearGradient(colors:<Color>[
                            Color(0xff7558F8),
                            Color(0xffF8588B),
                          ],
                          ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))) ,),
                      SizedBox(height: 3,),
                      Text(
                        Utils.getprofilesbyid.data!.designation != null || Utils.getprofilesbyid.data!.designation !=null ?
                            Utils.getprofilesbyid.data!.designation! : "Designation",

                        style:TextStyle(fontSize:16,fontWeight:FontWeight.w400 ,) ,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                        // if(widget.profile!.profileUrls![0] != null || widget.profile!.profileUrls![0].userName !="" )
                       ],
                     ),
                      Container(
                        height: 100,
                        width: 300,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: Utils.getprofilesbyid.data!.profileUrls!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(onPressed: (){}, icon:Image.network(Utils.getprofilesbyid.data!.profileUrls![index].socialMediaImageUrl!))
                                  // IconButton(onPressed: (){},
                                  //     icon: NetworkImage(Utils.getbizprofilesbyid.data!.profileUrls![index].socialMediaImageUrl![index],height: 40,width: 40,)),
                                  // IconButton(onPressed: (){},
                                  //     icon: Image.asset('assets/ico/IN.png',height: 40,width: 40,)),
                                  // IconButton(onPressed: (){},
                                  //     icon: Image.asset('assets/ico/TWIT.png',height: 40,width: 40,)),
                                  // IconButton(onPressed: (){},
                                  //     icon: Image.asset('assets/ico/Insta.png',height: 40,width: 40,)),
                                  // IconButton(onPressed: (){},
                                  //     icon: Image.asset('assets/ico/WAPP.png',height: 40,width: 40,)),
                                  // IconButton(onPressed: (){},
                                  //     icon: Image.asset('assets/ico/youtube.png',height: 40,width: 40,)),
                                ],
                              );
                            }),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/building 1.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Company",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: Utils.getprofilesbyid.data!.companyName != null ||  Utils.getprofilesbyid.data!.companyName != null?
                                Utils.getprofilesbyid.data!.companyName! :"Company",
                              // hintText:widget.profile!.companyName != null || widget.profile!.companyName != null?
                              // widget.profile!.companyName! : 'Company' ,

                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),
                      ),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/Layer_x0020_1.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Designation",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText:Utils.getprofilesbyid.data!.designation != null ||  Utils.getprofilesbyid.data!.designation != null?
                            Utils.getprofilesbyid.data!.designation! :"Designation" ,
                         // hintText:widget.profile!.designation != null || widget.profile!.designation != null?
                         //      widget.profile!.designation! : 'Designation' ,
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),
                      ),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/email.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Email",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: Utils.getprofilesbyid.data!.email != null ||  Utils.getprofilesbyid.data!.email != null?
                            Utils.getprofilesbyid.data!.email! :"Email",
                              // hintText:widget.profile!.email != null || widget.profile!.email != null?
                              // widget.profile!.email! : 'Email',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/mobile.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Mobile",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(
                              fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: Utils.getprofilesbyid.data!.mobileNo != null ||  Utils.getprofilesbyid.data!.mobileNo != null?
                            Utils.getprofilesbyid.data!.mobileNo! :"Mobile Number",
                              // hintText:widget.profile!.mobileNo!= null || widget.profile!.mobileNo != null?
                              // widget.profile!.mobileNo! : 'Mobile Number',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/Shape.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Website",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: Utils.getprofilesbyid.data!.website != null ||  Utils.getprofilesbyid.data!.website != null?
                            Utils.getprofilesbyid.data!.website! :"Website",
                              // hintText:widget.profile!.website!= null || widget.profile!.website != null?
                              // widget.profile!.website! : 'website',
                              //
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/Vector.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Address",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: Utils.getprofilesbyid.data!.address != null ||  Utils.getprofilesbyid.data!.address != null?
                            Utils.getprofilesbyid.data!.address! :"Address",
                            // hintText:widget.profile!.address!= null || widget.profile!.address != null?
                            // widget.profile!.address! : 'Address',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                          ),
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 120,
                  width: 364,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Image.asset("assets/ico/rup.png",height: 18,width: 18,),
                          SizedBox(width: 10,),
                          Text("Link",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 40,),
                          Padding(
                            padding: EdgeInsets.only(left:0),
                            child: Text("${ApiService.BASE_URL}"+ Utils.getprofilesbyid.data!.name!,style: TextStyle(fontSize: 15,
                                color: Colors.blue,fontWeight: FontWeight.w400),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 250,),
                          IconButton(onPressed: ()async{
                            await Clipboard.setData(ClipboardData(text:"${ApiService.BASE_URL}"+ Utils.getprofilesbyid.data!.name! ))
                                .then((result) {
                              Get.snackbar(AppName, "Copied Successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  icon: const Icon(Icons.done, color: Colors.green),
                                  colorText: Colors.white);
                            }
                            );
                          }, icon: Icon(Icons.copy)),
                          IconButton(onPressed: ()async{
                            await Share.share("${ApiService.BASE_URL}"+ Utils.getprofilesbyid.data!.name!);
                          }, icon: Icon(Icons.share_outlined)),

                        ],
                      )

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  width: 364,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Image.asset("assets/ico/link.png",height: 13,width: 13,),
                          SizedBox(width: 10,),
                          Text("Payment",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: (){},
                              splashColor: Colors.blue,
                              splashRadius: 13,
                              icon: Utils.getprofilesbyid.data!.phonePe != null ? Image.asset("assets/ico/Group 3037.png",height: 100,width: 100,): Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5gmDSgVFt8EaDKerZ5HvZHVfP0O7TN2rEA_xNgAYg&s")) ),
                          IconButton(onPressed: (){},
                              icon: Utils.getprofilesbyid.data!.googlePay !=null ? Image.asset("assets/ico/Group 3038.png",height: 100,width: 100,):Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5gmDSgVFt8EaDKerZ5HvZHVfP0O7TN2rEA_xNgAYg&s"))),
                          IconButton(onPressed: (){},
                              icon: Utils.getprofilesbyid.data!.paytm != null ?Image.asset("assets/ico/Group 3039.png",height: 100,width: 100,):Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5gmDSgVFt8EaDKerZ5HvZHVfP0O7TN2rEA_xNgAYg&s")))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                TextButton(
                  onPressed: (){

                      final updateProfilePicService = Get.put(ApiService());
                      updateProfilePicService.showProgressDialog();
                      var then = updateProfilePicService.GetCardPriceApi()
                          .then((value) {
                        if (value) {
                          setState(() {});
                          Navigator.push(context, CupertinoPageRoute(builder: (context)  =>BuyCard()));
                          print('Finished');
                        } else {
                          setState(() {});
                        }
                      });


                  },
                  child: Text("Profile card validity upto 28 Jan 2023\n          "
                      "     Buy Zeal Biz Card",
                    style: TextStyle(color: Colors.white,),),),
              ],
            ),

          ),

        ),
      ),
    );
  }
}
showAlertDialogQR(BuildContext context) async {
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20.0)),
        child: Container(
          height: 250,
          width: 50,
          child:  Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Center(
              child: QrImage(
                data:"${ApiService.BASE_URL}"+Utils.getprofilesbyid.data!.userName! ,
                size: 400,
              ),
            ),
          ),
        ),
      );
    },
  );
}
