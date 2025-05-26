import 'package:flutter/material.dart';

void main() {
  runApp(const ReviewEx1());
}

class ReviewEx1 extends StatelessWidget {
  const ReviewEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          title : Text("타이틀", style: TextStyle(fontWeight: FontWeight.bold, color : Colors.purple),)
        ),
        drawer: Drawer(),
        body : Row(
          children: [
            Expanded(child: Container(color: Colors.blue,)),
            Container(width: 200, color: Colors.green,),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                print("뒤로가기 클릭!");
              }, icon: Icon(Icons.backspace_outlined)),
              IconButton(onPressed: (){
                print("홈 클릭!");
              }, icon: Icon(Icons.home_filled)),
              IconButton(onPressed: (){
                print("로그아웃 클릭!");
              }, icon: Icon(Icons.logout_outlined))
            ],
          ),
        ),
      )
    );
  }
}
