import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:share_plus/share_plus.dart';
import 'package:zeal_biz/Api_Service/Utils.dart';
import 'package:zeal_biz/Navigation/bottom_bar.dart';
import 'package:zeal_biz/scr/Buy%20Card.dart';
import 'package:zeal_biz/scr/View_profile_personal.dart';
import 'package:zeal_biz/scr/Edit_Biz.dart';

import '../Api_Service/API.dart';




class Bizcard extends StatefulWidget {

  const Bizcard({Key? key}) : super(key: key);

  @override
  State<Bizcard> createState() => _BizcardState();
}

class _BizcardState extends State<Bizcard> {
  String quote="https://zeal.biz/albertjohn";

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


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            children: const [
              Text('Biz Card',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 20),),
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              showAlertDialogQR(context);
            }, icon:Image.asset('assets/ico/Scan.png',height: 40,width: 40,)),
            IconButton(onPressed: (){
             Navigator.push(context,CupertinoPageRoute(builder: (context)=>CreateBiz()));
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
                  height: 850,
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
                             image: Utils.getbizprofilesbyid.data!.companyLogo != null ? NetworkImage(Utils.getbizprofilesbyid.data!.companyLogo):NetworkImage("https://media.istockphoto.com/id/588258370/vector/male-avatar-profile-picture-vector.jpg?s=612x612&w=is&k=20&c=0GzYn9VEBuybNQyjd4n5-IU_i06drUgiubUwc-K1vsk="),
                            fit: BoxFit.cover,),
                        ),
                      ),

                      SizedBox(height: 8,),
                      Text(Utils.getbizprofilesbyid.data!.name != null || Utils.getbizprofilesbyid.data!.name !=null?
                          Utils.getbizprofilesbyid.data!.name! :"Name",
                      //   Utils.getprofiles.data![2].name != null || Utils.getprofiles.data![2].name != null?
                      // Utils.getprofiles.data![2].name! : ''

                        style:TextStyle(fontSize:30,fontWeight:FontWeight.w700 ,
                          foreground:Paint()..shader=const LinearGradient(colors:<Color>[
                            Color(0xff7558F8),
                            Color(0xffF8588B),
                          ],
                          ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))) ,),
                      SizedBox(height: 3,),
                      // Text(Utils.getbizprofilesbyid.data!.designation != null || Utils.getbizprofilesbyid.data!.designation !=null?
                      // Utils.getbizprofilesbyid.data!.designation! :"",style:TextStyle(fontSize:16,fontWeight:FontWeight.w400 ,) ,),
                      Container(
                        height: 100,
                        width: 300,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: Utils.getbizprofilesbyid.data!.profileUrls!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){}, icon:Image.network(Utils.getbizprofilesbyid.data!.profileUrls![index].socialMediaImageUrl!))
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
                              hintText:
                              Utils.getbizprofilesbyid.data!.name != null || Utils.getbizprofilesbyid.data!.name !=null?
                              Utils.getbizprofilesbyid.data!.name! :"Company Name",
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
                          const SizedBox(width: 5,),
                          const Text("GST",style: TextStyle(fontSize: 16,
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
                              hintText:
                              Utils.getbizprofilesbyid.data!.gstNo != null || Utils.getbizprofilesbyid.data!.gstNo !=null?
                              Utils.getbizprofilesbyid.data!.gstNo! :"Designation",

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
                              hintText:Utils.getbizprofilesbyid.data!.email != null || Utils.getbizprofilesbyid.data!.email !=null?
                              Utils.getbizprofilesbyid.data!.email! :"Email",

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
                          style: TextStyle(fontSize: 16,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              hintText:Utils.getbizprofilesbyid.data!.contactPersonPhoneNo != null || Utils.getbizprofilesbyid.data!.contactPersonPhoneNo !=null?
                              Utils.getbizprofilesbyid.data!.contactPersonPhoneNo! :"",

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
                              hintText:Utils.getbizprofilesbyid.data!.website != null || Utils.getbizprofilesbyid.data!.website !=null?
                              Utils.getbizprofilesbyid.data!.website! :"Website",

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
                              hintText:Utils.getbizprofilesbyid.data!.address != null || Utils.getbizprofilesbyid.data!.address !=null?
                              Utils.getbizprofilesbyid.data!.address! :"Address",

                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                          ),
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Products",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    )
                  ],
                ),
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
                            child: Text("${ApiService.BASE_URL}"+ Utils.getbizprofilesbyid.data!.name!,style: TextStyle(fontSize: 15,
                                color: Colors.blue,fontWeight: FontWeight.w400),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 250,),
                          IconButton(onPressed: ()async{
                            await Clipboard.setData(ClipboardData(text:"${ApiService.BASE_URL}"+ Utils.getbizprofilesbyid.data!.name!))
                                .then((result) {
                              Get.snackbar(AppName, "Copied Successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  icon: const Icon(Icons.done, color: Colors.green),
                                  colorText: Colors.white);
                            }
                            );
                          }, icon: Icon(Icons.copy)),
                          IconButton(onPressed: ()async{
                            await Share.share("${ApiService.BASE_URL}"+ Utils.getbizprofilesbyid.data!.name!);
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
                SizedBox(height: 20,),
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
