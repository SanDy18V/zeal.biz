import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeal_biz/scr/Onboard2.dart';
import 'package:zeal_biz/scr/Verification.dart';

class Onborded extends StatefulWidget {
  const Onborded({Key? key}) : super(key: key);

  @override
  State<Onborded> createState() => _OnbordedState();
}

class _OnbordedState extends State<Onborded> {
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
                margin: EdgeInsetsDirectional.only(top: 160),
                child: Image.asset('assets/images/Illustraion 01.png',height: 238,),),
              SizedBox(height: 70,),
              Container(
                child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight:FontWeight.w800),),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text('to Zeal.Biz',style: TextStyle(color: Colors.white,fontSize: 45,fontWeight:FontWeight.w700)),
              ),
              SizedBox(height: 15,),
              Container(
                child: Text('Share and add contacts easily Using',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w400),),
              ),
              SizedBox(height: 8,),
              Container(
                child: Text('Our great tool Zeal.biz',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w400),),
              ),
              SizedBox(
                height: 38,
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
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Onboarding()));
                  },
                  child: Text('Next',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                ),
              ),
              SizedBox(),
              Container(
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Verify()));
                  },
                  child: Text('Skip',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
