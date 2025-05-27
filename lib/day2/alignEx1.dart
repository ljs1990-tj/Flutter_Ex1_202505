import 'package:flutter/material.dart';

void main() {
  runApp(const AlignEx1());
}

class AlignEx1 extends StatelessWidget {
  const AlignEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Container(
        color : Colors.blue[50],
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 150, height: 150, color: Colors.green,
          ),
        ),
      )
    );
  }
}
