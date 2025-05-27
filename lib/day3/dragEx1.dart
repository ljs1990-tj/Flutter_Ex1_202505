import 'package:flutter/material.dart';

void main() => runApp(DragEx1());

class DragEx1 extends StatefulWidget {
  const DragEx1({super.key});

  @override
  State<DragEx1> createState() => _DragEx1State();
}

class _DragEx1State extends State<DragEx1> {
  Offset position = Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Stack(
          children: [
            Positioned(
                left: position.dx,
                top : position.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      position += details.delta;
                    });
                  },
                  child: Container(
                    width: 100, height: 100, color : Colors.blue[100],
                    child: Center(child: Text("박스!"),),
                  ),
                )
            )
          ],
        )
      )
    );
  }
}
