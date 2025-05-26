import 'package:flutter/material.dart';

void main() {
  runApp(const PositionedEx1());
}

class PositionedEx1 extends StatelessWidget {
  const PositionedEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Stack(
          children: [
            Container(color: Colors.lightBlue[100],),
            Positioned(
              top : 50,
              right : 80,
              child: Container(
                width: 150, height: 150, color: Colors.green,
              ),
            ),
          ],
        )
    );
  }
}
