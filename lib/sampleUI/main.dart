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
        child: Column(
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
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Icon(Icons.home, color : Colors.indigo),
                      title : Text("홈"),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.shop, color : Colors.indigo),
                      title : Text("쇼핑"),
                      trailing: Text("new", style: TextStyle(color : Colors.redAccent),),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.category, color : Colors.indigo),
                      title : Text("카테고리"),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite, color : Colors.indigo),
                      title : Text("내 위시리스트"),
                      trailing: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color : Colors.redAccent
                        ),
                        child: Text("4", style : TextStyle(color : Colors.white)),
                      ),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart, color : Colors.indigo),
                      title : Text("장바구니"),
                      trailing: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color : Colors.redAccent
                        ),
                        child: Text("2", style : TextStyle(color : Colors.white)),
                      ),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.login, color : Colors.indigo),
                      title : Text("로그인"),
                      onTap: (){},
                    ),
                    Divider(height: 10,),
                    ListTile(
                      leading: Icon(Icons.settings, color : Colors.indigo),
                      title : Text("설정"),
                      onTap: (){},
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color : Colors.indigo),
                      title : Text("로그아웃"),
                      onTap: (){},
                    ),
                  ],
                ),

            )
          ],
        ),
      ),
    );
  }
}
