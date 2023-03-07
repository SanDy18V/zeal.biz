import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
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
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Image.asset('assets/ico/ZEAL LOGO 1.png',height: 32,width: 128,)
            ],
          ),
          actions: [
            IconButton(onPressed: (){},
                icon:Image.asset('assets/ico/Notification.png',height: 30,width: 25,))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
             height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Biz Diary",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  height: 160,
                  width: 364,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:Column (
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10,left: 10),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage("https://www.kreedon.com/wp-content/uploads/2020/01/2019-mid-day.jpg?x50475"),
                            ),
                          ),
                          SizedBox(
                            width: 25,

                          ),
                          Text('Victor Vijay',style:TextStyle(fontSize:20,fontWeight:FontWeight.w700 ,
                              foreground:Paint()..shader=LinearGradient(colors:<Color>[
                                Color(0xff7558F8),
                                Color(0xffF8588B),
                              ],
                              ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 100.0))) ,),
                          SizedBox(width:80,),
                          IconButton(onPressed: (){},
                              icon: Image.asset("assets/ico/Call.png",height: 40,width: 40,)),
                        ],
                      ),
                      Text("Software Developer",style: TextStyle(fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Divider(color: Colors.grey,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: (){},
                              icon: Image.asset('assets/ico/FB.png',height: 40,width: 40,)),
                          IconButton(onPressed: (){},
                              icon: Image.asset('assets/ico/IN.png',height: 40,width: 40,)),
                          IconButton(onPressed: (){},
                              icon: Image.asset('assets/ico/TWIT.png',height: 40,width: 40,)),
                          IconButton(onPressed: (){},
                              icon: Image.asset('assets/ico/Insta.png',height: 40,width: 40,)),
                          IconButton(onPressed: (){},
                              icon: Image.asset('assets/ico/WAPP.png',height: 40,width: 40,)),
                        ],
                      ),
                    ],
                  ),

                ),


                SizedBox(height: 50,)
              ],
            ),
          ),

        ),
      ),
    );
  }
}
