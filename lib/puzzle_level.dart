import 'package:flutter/material.dart';
import 'package:mathspuzzel/second.dart';

class myworl extends StatefulWidget {
  int l;
  List level_statu;

  myworl(this.l, this.level_statu);
  @override
  State<myworl> createState() => _myworlState();
}

class _myworlState extends State<myworl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return second(index);
                  },
                ));
              },
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: (widget.l > index)
                    ? Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 25),
                )
                    : null,
                decoration: BoxDecoration(
                    image: (widget.l > index)
                        ?(widget.level_statu[index]=="yes")?DecorationImage(
                        image: AssetImage("image/tick.png")):DecorationImage(
                        image: AssetImage("image/wee.png"))
                        : DecorationImage(image: AssetImage("image/lock.png"))),
              ),
            );
          },
        ),
      ),
    );

  }
}
