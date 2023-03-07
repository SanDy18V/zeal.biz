import 'dart:async';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



import 'package:zeal_biz/Api_Service/Utils.dart';


import 'package:zeal_biz/scr/First_Update_Biz.dart';
import 'package:zeal_biz/scr/First_Update_person_page.dart';
import 'package:zeal_biz/scr/First_Update_social.dart';
import 'package:zeal_biz/scr/View_Biz.dart';
import 'package:zeal_biz/scr/View_profile_personal.dart';
import 'package:zeal_biz/scr/View_social.dart';


import '../Api_Service/API.dart';




import '../widgets/sharedPreference.dart';

class Dashboard extends StatefulWidget {



 const Dashboard({Key? key,}) : super(key: key);



  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {




  @override
  void initState(){

    Future token = Shared_Preferences().getToken();
    token.then((data) async {

      Utils.access_token = data;
     // Utils.socialMediaTypestest = data;
      //Utils.userData.data!.accessToken = data;
      print(data);

      final updateProfilePicService = Get.put(ApiService());
      updateProfilePicService.showProgressDialog();
      var then = updateProfilePicService.GetallprofilesApi()
          .then((value) {
        if (value) {
          setState(() {
            print("Hi");
          });
          print('Home');
        } else {
          setState(() {});
        }
      });

    });

   if(Utils.getprofiles.data?[ApiService.indexValue].name == null){
     Utils.getprofiles.data?[ApiService.indexValue].name == "";
     return;
   }


    super.initState();
    checkOnlineStatus();
  }

  @override
  void dispose(){

    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
   //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // toolbarHeight: 70,
          toolbarHeight: 180,
          title: Row(
            children: [
              SizedBox(width: 20,),
              Image.asset('assets/ico/ZEAL LOGO 1.png',height: 32,width: 128,)
            ],
          ),
          actions: [
            IconButton(onPressed: (){},
                icon:Image.asset('assets/ico/Notification.png',height: 30,width: 25,))
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 40,),
        Text("Welcome,",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,color: Colors.white),),
                Text(Utils.getprofiles.data?[ApiService.indexValue].name ?? "",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28,color: Colors.white),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 40,),
                Text('Share your cards with your friends easily',
                  style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
           SizedBox(height: 20,),
           Container(
             height: 425,
             width: 350,
             color: Colors.transparent,
             child: GridView.extent(
               maxCrossAxisExtent: 200,
               padding: const EdgeInsets.all(16),
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               primary: false,
               children: [
                 InkWell(
                   onTap:()async{
                     if(Utils.getprofiles.data == null  || Utils.getprofiles.data == [] ){
                       Get.off(FirstUpdateProfilePage());
                     }else if(Utils.getprofiles.data != null){
                       for(var i =0;i< Utils.getprofiles.data!.length;i++){
                         if(Utils.getprofiles.data![i].profileTypeId == 1){
                           print('santhossss1 ${Utils.getprofiles.data![i].companyId}');

                           print(Utils.getprofiles.data!.length);
                           Utils.CompanyIdPersonal = Utils.getprofiles.data![i].companyId!;
                           final updateProfilePicService = Get.put(ApiService());
                           updateProfilePicService.showProgressDialog();
                           var then = updateProfilePicService.GetallprofilesbyIDPersonalApi()
                               .then((value) {
                             if (value) {
                               setState(() {
                                 Get.to(()=>PerCard());
                               });
                               print('Finished');
                             }
                             else {
                               setState(() {

                               });
                             }
                           }
                           );// Get.to(()=>PerCard());
                         }
                       }
                     }else {
                       Get.off(FirstUpdateProfilePage());
                     }

                   },
                   child: Container(
                     height: 172,
                     width: 172,
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 30,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Image.asset('assets/ico/Profile Icon.png',height: 32,width: 24,)
                          ],
                        ),
                         SizedBox(height: 10,),
                         Row(
                         children: [
                           SizedBox(width: 10,),
                           Text("Profile Card",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                         ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("Personal Card",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                             SizedBox(width: 4,),
                             SizedBox(
                               child: Image.asset('assets/ico/Group 3030.png',height: 15,width: 15,),),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
                 InkWell(
                   onTap:()async{


                     if(Utils.getprofiles.data == null || Utils.getprofiles.data ==[] ){
                       print('Nooooooooooooooooo');
                       Get.off(FirstUpadateSocial());
                     }else if(Utils.getprofiles.data != null){
                       for(var i =0;i<Utils.getprofiles.data!.length;i++){
                         if(Utils.getprofiles.data![i].profileTypeId == 3){
                           print('santhossss2 ${Utils.getprofiles.data![i].companyId}');
                           print(Utils.getprofiles.data!.length);
                           Utils.CompanyIdsocial = Utils.getprofiles.data![i].companyId!;
                           final updateProfilePicService = Get.put(ApiService());
                           updateProfilePicService.showProgressDialog();
                           var then = updateProfilePicService.GetallprofilesbyIDSocialApi()
                               .then((value) {
                             if (value) {
                               setState(() {
                                 Get.to(()=>Social());
                               });
                               print('Finished');
                             } else {

                               setState(() {

                               });
                             }
                           });

                         }

                       }
                     }else{
                       Get.to(()=>FirstUpadateSocial());
                     }

                   },
                   child: Container(
                     height: 172,
                     width: 172,
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 30,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Image.asset('assets/ico/Social Icon.png',height: 32,width: 24,)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("Social Card",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("Social Card",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                             SizedBox(width: 4,),
                             SizedBox(
                               child: Image.asset('assets/ico/Group 3030.png',height: 15,width: 15,),),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
                 InkWell(
                   onTap:()async{
                     if(Utils.getprofiles.data == null|| Utils.getprofiles.data == [] ){

                       Get.off(FirstUpdateBiz());

                     }else if(Utils.getprofiles.data != null){
                       for(var i =0;i< Utils.getprofiles.data!.length;i++){
                         if(Utils.getprofiles.data![i].profileTypeId == 2){
                           print('santhossss3 ${Utils.getprofiles.data![i].companyId}');
                           print(Utils.getprofiles.data!.length);
                           Utils.CompanyIdBiz = Utils.getprofiles.data![i].companyId!;
                           final updateProfilePicService = Get.put(ApiService());
                           updateProfilePicService.showProgressDialog();
                           var then = updateProfilePicService.GetallprofilesbyIDBizApi()
                               .then((value) {
                             if (value) {
                               setState(() {
                                 Get.to(()=>Bizcard());
                               });
                               print('Finished');
                             } else {
                               setState(() {});
                             }
                           });

                         }
                       }
                     }
                   },
                   child: Container(
                     height: 172,
                     width: 172,
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 30,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Image.asset('assets/ico/Untitled.png',height: 32,width: 24,)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("Business Card",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("BIz Card",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                             SizedBox(width: 4,),
                             SizedBox(
                               child: Image.asset('assets/ico/Group 3030.png',height: 15,width: 15,),),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
                 InkWell(
                   onTap:(){},
                   child: Container(
                     height: 172,
                     width: 172,
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 30,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Image.asset('assets/ico/Biz Icon.png',height: 32,width: 24,)
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("Corporate Card",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                           ],
                         ),
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             Text("Corporate Card",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                             SizedBox(width: 4,),
                             SizedBox(
                               child: Image.asset('assets/ico/Group 3030.png',height: 15,width: 15,),),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),


               ],
             ),
           )
          ],
        ),
      ),

    );

  }

}


Future<bool> checkOnlineStatus() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }else{

    Get.snackbar(AppName, "Unable to Connect Zeal.Biz server",
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error, color: Colors.yellowAccent
        ),
        colorText: Colors.white);

    return false;
  }
}
