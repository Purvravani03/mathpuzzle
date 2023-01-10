import 'package:flutter/material.dart';
import 'package:mathspuzzel/main.dart';
import 'package:mathspuzzel/second.dart';

class third extends StatefulWidget {
  int cur_level;
  third(this.cur_level);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/3.jpg"))),height: double.infinity,width: double.infinity,child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Expanded(child: Container(alignment:Alignment.center,child: Text("PUZZLE ${widget.cur_level} COMPLITED",style: TextStyle(fontSize: 25),),)),
        Expanded(flex: 4,child: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/trophy.png"))),)),
        Expanded(child: InkWell(onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return second(widget.cur_level);
          },));
        },child:Container(alignment: Alignment.center,margin: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.white,Colors.grey])),width: 150,child: Text("CONTINUE",style: TextStyle(fontSize: 20)),))),
        Expanded(child: InkWell(onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return MyApp(widget.cur_level);
          },));

        },child: Container(alignment: Alignment.center,margin: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.white,Colors.grey])),width: 150,child: Text("MAIN MENU",style: TextStyle(fontSize: 20)),),)),
        Expanded(child: Container(alignment: Alignment.center,margin: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.white,Colors.grey])),width: 150,child: Text("BUY PRO",style: TextStyle(fontSize: 20),),)),
        Text("SHARE THIS PUZZLE"),
        Container(margin: EdgeInsets.all(10),height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [Colors.white,Colors.grey])),child: Icon(Icons.share),),
        Spacer(),

      ]),)),
    );
    ;
  }
}
