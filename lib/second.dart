import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathspuzzel/3.dart';
import 'package:mathspuzzel/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {

  int cur_level;
  second(this.cur_level);
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  SharedPreferences? shae;
  int cur_level=0;
  String str = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cur_level=widget.cur_level;
    get();
  }
  get()
  async {
    shae = await SharedPreferences.getInstance();
    cur_level=shae!.getInt("levelno")??0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("image/gameplaybackground.jpg"))),
          child: Column(
            children:[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                InkWell(onTap: () {
                  if(shae!.getString("skip_time") != null)
                  {
                    DateTime dt=DateTime.now();
                    String past_time=shae!.getString("skip_time")??"";
                    DateTime dt1=DateTime.parse(past_time);
                    int sec=dt.difference(dt1).inSeconds;
                    if(sec>=30)
                    {
                      String skip_time=DateTime.now().toString();
                      shae!.setString("skip_time", skip_time);
                      shae!.setString("level_status$cur_level", "skip");
                      setState(() {
                        cur_level++;
                      });
                      shae!.setInt("levelno", cur_level);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return third(cur_level);
                      },));
                    }else{
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(title: Text("Wait for ${30-sec} second after that you can this skip level"),actions: [TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("Ok"))],);
                      },);
                    }
                  }else
                  {
                    String skip_time=DateTime.now().toString();
                    shae!.setString("skip_time", skip_time);
                    shae!.setString("level_status$cur_level", "skip");
                    setState(() {
                      cur_level++;
                    });
                    shae!.setInt("levelno", cur_level);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return third(cur_level);
                    },));
                  }

                },child: CircleAvatar(foregroundImage: AssetImage("image/skip.png"),),),
                Container(
                  height: 55,
                  width: 180,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage("image/board.png"))),
                  child: Text(
                    "Puzzle ${cur_level+1}",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  alignment: Alignment.center,
                ),
                CircleAvatar(foregroundImage: AssetImage("image/hint.png"),),
              ]
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("image/${date.img[cur_level]}"))),

                  )),
              Spacer(flex: 2),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 50,
                            width: 200,
                            color: Colors.white,
                            child: Text(
                              "$str",
                              style: TextStyle(fontSize: 30),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          InkWell(
                            onTap: () => mywork("-"),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 50,
                              width: 60,
                              color: Colors.white12,
                              child: Center(
                                child: Icon(
                                  Icons.backspace_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              int a=int.parse(str);
                              if(date.ans[cur_level]==a) {
                                setState(() {
                                  shae!.setString("level_status$cur_level", "yes");
                                  cur_level++;
                                  shae!.setInt("levelno", cur_level);
                                });
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return third(cur_level);
                                },));
                              }
                              else{
                                Fluttertoast.showToast(
                                    msg: "wrong",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            },
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 90,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => mywork("1"),
                            child: Container(
                              height: 50,
                              width: 33,
                              color: Colors.white12,
                              margin: EdgeInsets.all(3),
                              child: Text(
                                "1",
                                style:
                                TextStyle(color: Colors.white, fontSize: 25),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          InkWell(
                            onTap: () => mywork("2"),
                            child: Container(
                                height: 50,
                                width: 33,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("3"),
                            child: Container(
                                height: 50,
                                width: 33,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("4"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "4",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("5"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "5",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("6"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("7"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "7",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("8"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "8",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("9"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "9",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                          InkWell(
                            onTap: () => mywork("0"),
                            child: Container(
                                height: 50,
                                width: 32,
                                color: Colors.white12,
                                margin: EdgeInsets.all(3),
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                alignment: Alignment.center),
                          ),
                        ],
                      )
                    ]),
                  ))
            ],
          ),
        ),)
    );
  }

  mywork(String p) {
    setState(() {
      if (p == "-") {
        str = str.substring(0, str.length - 1);
      } else if (int.parse(p) >= 0 && int.parse(p) <= 9) {
        str = str + p;
      }
    });

  }
}
