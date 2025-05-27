import 'package:flutter/material.dart';

void main() {
  runApp(const DrawerEx1());
}

class DrawerEx1 extends StatelessWidget {
  const DrawerEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color : Colors.lightBlue[200]),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("img1.jpg"),
                      ),
                      SizedBox(height: 5,),
                      Text("한교동", style: TextStyle(fontSize: 14, color : Colors.purple), ),
                      SizedBox(height: 5,),
                      Text("gyodong@naver.com", style: TextStyle(fontSize: 14, color : Colors.purple), )
                    ],
                  )
              ),
              ListTile(
                leading: Icon(Icons.home),
                title : Text("홈"),
                onTap: (){},
              ),
              ListTile(
                  leading: Icon(Icons.camera_alt),
                  title : Text("카메라"),
                  onTap: (){},
              ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title : Text("로그아웃"),
                  onTap: (){},
              )
            ],
          ),
        ),
      )
    );
  }
}
