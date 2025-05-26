import 'package:flutter/material.dart';

void main() {
  runApp(const GestureEx1());
}

class GestureEx1 extends StatelessWidget {
  const GestureEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Center(
          child: GestureDetector(
            onTap: (){
              print("눌렀네?");
            },
            child: Container(
              width: 150, height: 150, color: Colors.blue,
              child: Center(child: Text("눌러라"),),
            ),
          ),
        ),
      )
    );
  }
}
