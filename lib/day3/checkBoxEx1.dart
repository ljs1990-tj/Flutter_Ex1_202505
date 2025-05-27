import 'package:flutter/material.dart';

void main() => runApp(CheckBoxEx1());

class CheckBoxEx1 extends StatefulWidget {
  const CheckBoxEx1({super.key});

  @override
  State<CheckBoxEx1> createState() => _CheckBoxEx1State();
}

class _CheckBoxEx1State extends State<CheckBoxEx1> {
  bool isChecked = false;
  bool isCheckedOrcle = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Column(
          children: [
            Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                ),
                Text("자바"),

                Checkbox(
                  value: isCheckedOrcle,
                  onChanged: (value) {
                    setState(() {
                      isCheckedOrcle = value!;
                    });
                  },
                ),
                Text("오라클")
              ],
            ),

          ],
        )
      )
    );
  }
}
