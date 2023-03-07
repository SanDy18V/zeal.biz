
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:zeal_biz/scr/Homescr.dart';
import 'package:zeal_biz/scr/diary.dart';
import 'package:zeal_biz/widgets/sharedPreference.dart';
import '../scr/Onboard1.dart';
class Bottom extends StatefulWidget {

  @override
  State createState() => _Bottom();
}

class _Bottom extends State {

  Widget? _child;


  @override
  void initState() {

    _child = Dashboard();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: ()async=> false,
        child: Scaffold(
          backgroundColor: Color(0xFFEAC0DC),
          extendBody: true,
          body: _child,
          bottomNavigationBar: FluidNavBar(
            icons: [
              FluidNavBarIcon(
                  icon: Icons.account_circle,
                  backgroundColor: Colors.white70,
                  extras: {"label": "home"}),
              FluidNavBarIcon(
                  icon: Icons.contacts,
                  backgroundColor: Colors.white70,
                  extras: {"label": "account"}),
              FluidNavBarIcon(
                icon: Icons.settings,
                backgroundColor: Colors.white70,
                extras: {"label": "settings"},
              ),

            ],
            onChange: _handleNavigationChange,
            style: FluidNavBarStyle(
              barBackgroundColor: Colors.white70,
              iconSelectedForegroundColor: Color(0xff7558F8),
              iconUnselectedForegroundColor: Color(0xffF8588B),),

            scaleFactor: 1.2,
            defaultIndex: 0,
            itemBuilder: (icon, item) => Semantics(
              label: icon.extras!["label"],
              child: item,
            ),
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = Dashboard();
          break;
        case 1:
          _child = Diary();
          break;
        case 2:
          _child = Log();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        duration: Duration(milliseconds:10),
        child: _child,
      );
    });
  }
}

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Settings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:50),
            height: 50,
            width: 364,
            child: Row(
              children: [
                SizedBox(width: 20,),
                Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
                SizedBox(width:180,),
                IconButton(onPressed: ()async{
                  showAlertDialog(context);
                }, icon: Icon(Icons.logout,color: Colors.white,))
              ],
            ),
          ),
        ),
      ),


    );
  }


  showAlertDialog(BuildContext context) async {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Get.to(()=> Bottom());

        // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>Bottom()));
      },
    );
    Widget continueButton = TextButton(
      child: Text("yes"),
      onPressed: () async {

        await Shared_Preferences().removeAll();
        print("loggggggggg out");
        Navigator.of(context, rootNavigator: true).pop();

        Get.offAll(()=>Onborded());
        //
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => Onborded()), (
        //     route) => false);
        print("yyyyyyyyyyyy");
      }
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text(
          "Do you want exit the application"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

