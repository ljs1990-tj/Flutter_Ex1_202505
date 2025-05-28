import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() => runApp(ConfettiApp());

class ConfettiApp extends StatelessWidget {
  const ConfettiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : ConfettiExam()
    );
  }
}

class ConfettiExam extends StatefulWidget {
  const ConfettiExam({super.key});

  @override
  State<ConfettiExam> createState() => _ConfettiExamState();
}

class _ConfettiExamState extends State<ConfettiExam> {
  late ConfettiController ctrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl = ConfettiController(duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  ctrl.play();
                },
                child: Text("안녕"),

            ),
            ConfettiWidget(
                confettiController: ctrl,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: [Colors.blue, Colors.yellow, Colors.purple, Colors.green],
                numberOfParticles: 300,
            )
          ],
        ),
      )
    );
  }
}
