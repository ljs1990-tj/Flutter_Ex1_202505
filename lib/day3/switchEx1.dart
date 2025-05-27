import 'package:flutter/material.dart';

void main() {
  runApp(const SwitchEx1());
}

class SwitchEx1 extends StatefulWidget {
  const SwitchEx1({super.key});

  @override
  State<SwitchEx1> createState() => _SwitchEx1State();
}

class _SwitchEx1State extends State<SwitchEx1> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
              ),
              Text(isSwitched ? "켰다" : "껏다")
            ],
          ),
        ),
      )
    );
  }
}
