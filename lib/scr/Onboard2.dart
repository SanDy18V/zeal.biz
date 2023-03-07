import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeal_biz/scr/Onboard1.dart';
import 'package:zeal_biz/scr/Onboard3.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 160),
                child: Image.asset('assets/images/Illustration 02.png',height: 200,),),
              SizedBox(height: 20,),
              Container(
                child: Text('Biz Diary',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight:FontWeight.w800),),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text('Keep it Organized',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight:FontWeight.w700)),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text('Store & Manage all your Business',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w400),),
              ),
              SizedBox(height: 8,),
              Container(
                child: Text('Contacts in one place',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w400),),
              ),
              SizedBox(
                height: 70,
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
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>OnBoardw()));
                  },
                  child: Text('Next',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                ),
              ),
              SizedBox(),
              Container(
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Onborded()));
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
