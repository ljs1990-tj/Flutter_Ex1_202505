import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(SliderApp());

class SliderApp extends StatelessWidget {
  const SliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : SliderExam()
    );
  }
}

class SliderExam extends StatelessWidget {
  List<String> list = [
    "img1.jpg",
    "img2.jpg",
    "iu1.jpg",
    "iu2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: CarouselSlider(
            items: list.map((item)=>Container(
              width: double.infinity,
              margin : EdgeInsets.all(10),
              child: Image.asset(item, fit: BoxFit.cover,),
            )).toList(),
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 1,
              aspectRatio: 16 / 9,
            )
        ),
      )
    );
  }
}

