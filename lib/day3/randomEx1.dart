import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(RandomEx1());

class RandomEx1 extends StatefulWidget {
  const RandomEx1({super.key});

  @override
  State<RandomEx1> createState() => _RandomEx1State();
}

class _RandomEx1State extends State<RandomEx1> {
  Random ran = Random();
  List<Widget> list = [];
  int idx = 0;
  void removeItem(int index){
    if(index == idx){
      idx++;
      setState(() {
        list.removeAt(0);
      });
      if(list.length == 0){
        idx = 0;
        createList();
      }
    }
  }

  Offset generatePosition(double width, double height){
    double x = ran.nextDouble() * (width - 50);
    double y = ran.nextDouble() * (height - 50);
    return Offset(x, y);
  }

  void createList(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> tempList = [];
    for(int i=0; i<10; i++){
      Offset position = generatePosition(width, height);
      tempList.add(
          Positioned(
              left : position.dx,
              top : position.dy,
              child: GestureDetector(
                onTap: () => removeItem(i),
                child: Container(
                  height: 30, width: 30, color: Colors.blue[100],
                  child: Center(child: Text((i+1).toString()),),
                ),
              )
          )
      );
    }
    setState(() {
      list = tempList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      createList();
    },);

  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        home : Scaffold(
            body : Stack(
              children: list,
            )
        )
    );
  }
}
