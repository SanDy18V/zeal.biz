import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';
import 'package:zeal_biz/Navigation/bottom_bar.dart';
import 'package:zeal_biz/scr/View_profile_personal.dart';
import 'package:zeal_biz/scr/Edit_social.dart';

import '../Api_Service/API.dart';


import 'Buy Card.dart';

class Social extends StatefulWidget {

  const Social({Key? key,}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  void initState() {

    final updateProfilePicService = Get.put(ApiService());
    updateProfilePicService.showProgressDialog();
    var then = updateProfilePicService.GetallprofilesbyIDSocialApi()
        .then((value) {
      if (value) {
        setState(() {});
        print('Finished');
      } else {
        setState(() {});
      }
    });
  }
  String quote="https://zeal.biz/albertjohn";
  @override
  Widget build(BuildContext context) {
    return  Container(
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
              Text('Social Card',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 20),),
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              showAlertDialogQR(context);
            }, icon:Image.asset('assets/ico/Scan.png',height: 40,width: 40,)),
            IconButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=> Createsocial()));
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
              image: DecorationImage(image: AssetImage('assets/images/tech.png'),fit: BoxFit.none,alignment: Alignment.topRight),
            ),
            child: Column(
              children: [
                Container(
                  height: 600,
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
                            image: Utils.getsocialprofilesbyid.data!.companyLogo != null ?NetworkImage(Utils.getsocialprofilesbyid.data!.companyLogo):NetworkImage("https://media.istockphoto.com/id/588258370/vector/male-avatar-profile-picture-vector.jpg?s=612x612&w=is&k=20&c=0GzYn9VEBuybNQyjd4n5-IU_i06drUgiubUwc-K1vsk="),
                            // image: NetworkImage(Utils.paylist_image[index]),
                            fit: BoxFit.cover,),
                        ),
                      ),

                      SizedBox(height: 8,),
                      Text(Utils.getsocialprofilesbyid.data!.name != null ||  Utils.getsocialprofilesbyid.data!.name != null?
                      Utils.getsocialprofilesbyid.data!.name! :"",style:TextStyle(fontSize:30,fontWeight:FontWeight.w700 ,
                          foreground:Paint()..shader=LinearGradient(colors:<Color>[
                            Color(0xff7558F8),
                            Color(0xffF8588B),
                          ],
                          ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))) ,),
                      SizedBox(height: 3,),
                      // Text("Designation",style:TextStyle(fontSize:16,fontWeight:FontWeight.w400 ,) ,),
                      Container(
                        height: 100,
                        width: 300,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: Utils.getsocialprofilesbyid.data!.profileUrls!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){}, icon:Image.network(Utils.getsocialprofilesbyid.data!.profileUrls![index].socialMediaImageUrl!))
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
                            child: Image.asset("assets/ico/Layer_x0020_1.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Bio",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 40,right: 30),
                        child: TextField(
                          enabled: false,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                              hintText:   Utils.getsocialprofilesbyid.data!.bio != null ||  Utils.getsocialprofilesbyid.data!.bio != null?
                              Utils.getsocialprofilesbyid.data!.bio! :"",hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),
                      ),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Image.asset("assets/ico/mobile.png",height: 16,width: 18,),
                          ),
                          SizedBox(width: 5,),
                          Text("Mobile Number",style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,color: Color(0xff929090)),),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40,right: 30),
                        child: TextFormField(
                          enabled: false,
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              // hintText:  Utils.getprofiles.data![1].phoneNo != null || Utils.getprofiles.data![1].phoneNo != null?
                              // Utils.getprofiles.data![1].phoneNo! : 'Mobile number'
                                  hintText: Utils.getsocialprofilesbyid.data!.mobileNo != null ||  Utils.getsocialprofilesbyid.data!.mobileNo != null?
                                  Utils.getsocialprofilesbyid.data!.mobileNo! :"",hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),
                      ),
                      SizedBox(height:10,),
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
                        child: Text("${ApiService.BASE_URL}"+ Utils.getsocialprofilesbyid.data!.name!,style: TextStyle(fontSize: 15,
                            color: Colors.blue,fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 250,),
                      IconButton(onPressed: ()async{
                        await Clipboard.setData(ClipboardData(text:"${ApiService.BASE_URL}"+ Utils.getsocialprofilesbyid.data!.name!))
                            .then((result) {
                          Get.snackbar(AppName, "Copied Successfully",
                              snackPosition: SnackPosition.BOTTOM,
                              icon: const Icon(Icons.done, color: Colors.green),
                              colorText: Colors.white);
                        }
                        );
                      }, icon: Icon(Icons.copy)),
                      IconButton(onPressed: ()async{
                        await Share.share("${ApiService.BASE_URL}"+ Utils.getsocialprofilesbyid.data!.name!);
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
                             icon: Image.asset("assets/ico/Group 3037.png",height: 100,width: 100,)),
                         IconButton(onPressed: (){},
                             icon: Image.asset("assets/ico/Group 3038.png",height: 100,width: 100,)),
                         IconButton(onPressed: (){},
                             icon: Image.asset("assets/ico/Group 3039.png",height: 100,width: 100,))
                       ],
                     ),
                   ],
                 ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>BuyCard()));
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
