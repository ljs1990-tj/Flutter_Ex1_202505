import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const QRCodeEx1());
}

class QRCodeEx1 extends StatefulWidget {
  const QRCodeEx1({super.key});

  @override
  State<QRCodeEx1> createState() => _QRCodeEx1State();
}

class _QRCodeEx1State extends State<QRCodeEx1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Center(
          child: QrImageView(
              data: "http://www.naver.com",
              version: QrVersions.auto,
              size : 200
          ),
        )
      )
    );
  }
}
