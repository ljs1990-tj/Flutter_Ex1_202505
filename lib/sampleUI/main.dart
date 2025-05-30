import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Main()
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("메인페이지")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("iu2.jpg"),
                      fit : BoxFit.cover
                  )
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("img1.jpg"),
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("홍길동", style: TextStyle(color : Colors.purple, fontWeight: FontWeight.bold),),
                        Text("hong@naver.com", style: TextStyle(color : Colors.purple, fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                )
            ),
            Expanded(
                child: ListTile(
                  leading: Icon(Icons.home, color : Colors.indigo),
                  title : Text("홈"),
                  onTap: (){},
                )
            )
          ],
        ),
      ),
    );
  }
}
