import 'package:flutter/material.dart';

void main() => runApp(RadioEx1());

class RadioEx1 extends StatefulWidget {
  const RadioEx1({super.key});

  @override
  State<RadioEx1> createState() => _RadioEx1State();
}

class _RadioEx1State extends State<RadioEx1> {
  String selectItem = "java";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Column(
          children: [
            ListTile(
              leading: Radio(
                  value: "java",
                  groupValue: selectItem,
                  onChanged: (value) {
                    setState(() {
                      selectItem = value!;
                    });
                  },
              ),
              title : Text("자바")
            ),
            ListTile(
                leading: Radio(
                  value: "oracle",
                  groupValue: selectItem,
                  onChanged: (value) {
                    setState(() {
                      selectItem = value!;
                    });
                  },
                ),
                title : Text("오라클")
            ),
            ListTile(
                leading: Radio(
                  value: "html",
                  groupValue: selectItem,
                  onChanged: (value) {
                    setState(() {
                      selectItem = value!;
                    });
                  },
                ),
                title : Text("HTML")
            ),
            Text("선택 과목 : $selectItem")
          ],
        )
      )
    );
  }
}
