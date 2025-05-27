import 'package:flutter/material.dart';

void main() {
  runApp(const BtnEventEx1());
}

class BtnEventEx1 extends StatefulWidget {
  const BtnEventEx1({super.key});

  @override
  State<BtnEventEx1> createState() => _BtnEventEx1State();
}

class _BtnEventEx1State extends State<BtnEventEx1> {
  var _txt = "Flutter";
  var _color = Colors.blue[100];
  var _align = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Align(
          alignment: _align,
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  if(_txt == "Flutter"){
                    _txt = "재밌다";
                    _color = Colors.green[100];
                    _align = Alignment.topCenter;
                  } else {
                    _txt = "Flutter";
                    _color = Colors.blue[100];
                    _align = Alignment.center;
                  }
                });
              },
              child : Text(_txt),
              style : ButtonStyle(backgroundColor: WidgetStateProperty.all(_color))
          ),
        )
      )
    );
  }
}
