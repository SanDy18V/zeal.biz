import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeal_biz/scr/Onboard2.dart';
import 'package:zeal_biz/scr/Verification.dart';

class OnBoardw extends StatefulWidget {
  const OnBoardw({Key? key}) : super(key: key);

  @override
  State<OnBoardw> createState() => _OnBoardwState();
}

class _OnBoardwState extends State<OnBoardw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          image: DecorationImage(image: AssetImage('assets/images/tech.png'),fit: BoxFit.none,alignment: Alignment.topRight),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 87),
                child: Image.asset("assets/images/Illustration 03.png",height: 373,width: 414,),),
              SizedBox(height: 30,),
              Container(
                child: Text('Tap Mobile to',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight:FontWeight.w800),),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text('Share your Profiles',style: TextStyle(color: Colors.white,fontSize: 38,fontWeight:FontWeight.w700)),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text('You can share any profiles using',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w400),),
              ),
              SizedBox(height: 8,),
              Container(
                child: Text('this NFC tap feature',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w400),),
              ),
              SizedBox(
                height: 20,
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
                    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Verify()));
                  },
                  child: Text('Next',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                ),
              ),
              SizedBox(),
              Container(
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Onboarding()));
                  },
                  child: Text('Back',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
