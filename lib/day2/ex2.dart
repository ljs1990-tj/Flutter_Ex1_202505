import 'package:flutter/material.dart';

void main() {
  runApp(const Ex2());
}

class Ex2 extends StatefulWidget {
  const Ex2({super.key});

  @override
  State<Ex2> createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  var txt = "Flutter";
  var color = Colors.green[100];
  var _align = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
            body : Align(
              alignment: _align,
              child: Container(
                height: 200, width: 200,
                child: ElevatedButton(
                  child : Text(txt, style : TextStyle(fontSize: 25)),
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(color)),
                  onPressed: (){
                    setState(() {
                      if(txt == 'Flutter'){
                        txt = '재밌다';
                        color = Colors.blue[100];
                        _align = Alignment.topCenter;
                      } else {
                        txt = 'Flutter';
                        color = Colors.green[100];
                        _align = Alignment.center;
                      }
                    });
                  },
                ),
              ),
            )
        )
    );
  }
}
