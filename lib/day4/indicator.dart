import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(IndicatorApp());

class IndicatorApp extends StatelessWidget {
  const IndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : IndicatorExam()
    );
  }
}

class IndicatorExam extends StatelessWidget {
  const IndicatorExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("인디케이터")),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("원형"),
            SizedBox(height: 10,),
            CircularPercentIndicator(
                radius: 100,
                lineWidth: 10,
                percent: 0.75,
                center: Text("75%"),
                progressColor: Colors.blue,
                backgroundColor: Colors.grey,
                animation: true,
                animationDuration: 1000,
            ),
            SizedBox(height: 30,),
            Text("직선"),
            SizedBox(height: 10,),
            LinearPercentIndicator(
              lineHeight: 50,
              percent: 0.7,
              center: Text("70%"),
              progressColor: Colors.green,
              backgroundColor: Colors.grey,
              animation: true,
              animationDuration: 1000,
              barRadius: Radius.circular(20),
            )

          ],
        ),
      )
    );
  }
}
