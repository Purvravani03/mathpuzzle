import 'package:flutter/material.dart';
import 'package:mathspuzzel/puzzle_level.dart';
import 'package:mathspuzzel/second.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(0),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  int cur_level;

  MyApp(this.cur_level);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String cur_font = "font1";
  SharedPreferences? shae;
  static List level_statu = [];
  int l = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level_statu = List.filled(20, "no");
    get();
  }

  get() async {
    shae = await SharedPreferences.getInstance();
    l = shae!.getInt("levelno") ?? 0;

    for (int i = 0; i < l; i++) {
      level_statu[i] = shae!.getString("level_status$i") ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("image/3.jpg"))),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Text(
                    "Math Puzzles",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        color: Colors.deepPurple),
                  ),
                  alignment: Alignment.bottomCenter,
                )),
            Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage("image/2.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => second(l)));
                        },
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                              fontFamily: cur_font,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return myworl(l, level_statu);
                            },
                          ));
                        },
                        child: Text(
                          "PUZZLES",
                          style: TextStyle(
                              fontFamily: cur_font,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "BUY PRO",
                          style: TextStyle(
                              fontFamily: cur_font,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Share.share(
                                  'https://play.google.com/store/apps/details?id=com.applabs.puzzle&referrer=utm_source%3Dself');
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.white,
                                    Colors.grey.shade900
                                  ]),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.only(top: 20),
                              child: Icon(
                                Icons.share,
                                size: 30,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.white,
                                    Colors.grey.shade900
                                  ]),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.only(left: 10, top: 20),
                              child: Icon(
                                Icons.mail_outline_sharp,
                                size: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            child: Text("Privacy Policy"),
                            alignment: Alignment.center,
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
    ;
  }
}
