import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(FontApp());

class FontApp extends StatelessWidget {
  const FontApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("기본 텍스트", style: TextStyle(fontSize: 20),),
              Text("나눔고딕", style: GoogleFonts.nanumGothic(fontSize: 20),),
              Text("aBeeZee", style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(fontSize: 20, color: Colors.blue)
              ),)
            ],
          ),
        )
      )
    );
  }
}
