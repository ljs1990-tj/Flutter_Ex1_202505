import 'package:flutter/material.dart';

void main() {
  runApp(const GestureEx2());
}

class GestureEx2 extends StatefulWidget {
  const GestureEx2({super.key});

  @override
  State<GestureEx2> createState() => _GestureEx2State();
}

class _GestureEx2State extends State<GestureEx2> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : GestureDetector(
        onTap: (){
          setState(() {
            isDark = !isDark;
          });
        },
        child: Container(
          width: 150, height: 150, color: isDark ? Colors.black : Colors.white,
          child: Center(child: Text("클릭!", style: TextStyle(color : isDark ? Colors.white : Colors.black),),),
        ),
      )
    );
  }
}
