import 'package:flutter/material.dart';

void main() => runApp(DragEx2());

class DragEx2 extends StatefulWidget {
  const DragEx2({super.key});

  @override
  State<DragEx2> createState() => _DragEx2State();
}

class _DragEx2State extends State<DragEx2> {
  Offset position = Offset(100, 100);
  double boxSize = 100;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title : Text("제목")),
        body : Stack(
          children: [
            Positioned(
                left: position.dx,
                top : position.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      double x = position.dx + details.delta.dx;
                      double y = position.dy + details.delta.dy;

                      x = x.clamp(0.0, screenSize.width - boxSize);
                      y = y.clamp(0.0, screenSize.height - boxSize - kToolbarHeight);

                      position = Offset(x, y);

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
