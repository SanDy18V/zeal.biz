import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zeal_biz/scr/View_profile_personal.dart';

import '../Api_Service/Utils.dart';

class BuyCard extends StatefulWidget {
  const BuyCard({Key? key}) : super(key: key);

  @override
  State<BuyCard> createState() => _BuyCardState();
}

class _BuyCardState extends State<BuyCard> {
@override
  // void initState() {
  // final updateProfilePicService = Get.put(ApiService());
  // updateProfilePicService.showProgressDialog();
  // var then = updateProfilePicService.GetCardPriceApi()
  //     .then((value) {
  //   if (value) {
  //     setState(() {});
  //     print('Finished');
  //   } else {
  //     setState(() {});
  //   }
  // });
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.to(()=>PerCard());
        },icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Container(
             child: Center(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [

                   Text("Purchase Card",style: TextStyle(fontSize: 20,color: Colors.black),),
                   SizedBox(height: 25,),
                   Text("Price Zeal.biz",style: TextStyle(fontSize: 25,color: Colors.black),),
                   SizedBox(height: 20,),
                   Text("Actual Price RS: ${Utils.getcardpriceresponse.data!.actualPrice!}"
                   ,style: TextStyle(decoration: TextDecoration.lineThrough,
                       fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                   SizedBox(height: 20,),
                   Text("Discounted Price RS: ${Utils.getcardpriceresponse.data!.discountedPrice!}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                   SizedBox(height: 20,),
                   Padding(
                     padding: const EdgeInsets.only(left: 30),
                     child: Row(
                       children: [
                         Text("Address-1",style: TextStyle(
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
                         Text("Address-2 (Optional)",style: TextStyle(
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
                         Text("ZipCode",style: TextStyle(
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
                         Text("Contact.No",style: TextStyle(
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
                         Text("GST NO",style: TextStyle(
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
                     onTap: (){},
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
                   ),
                   SizedBox(height: 30,),
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
