import 'package:flutter/material.dart';
import 'package:sample1/day7/payment_test.dart';

void main() => runApp(PayApp());

class PayApp extends StatelessWidget {
  const PayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : PaymentExam()
    );
  }
}

class PaymentExam extends StatelessWidget {
  const PaymentExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("결제")),
      body : Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => Payment(),
                  )

              );
            },
            child: Text("결제하기")
        ),
      )
    );
  }
}
