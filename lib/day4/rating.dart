import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(RatingEx1());

class RatingEx1 extends StatelessWidget {
  const RatingEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : RatingApp()
    );
  }
}

class RatingApp extends StatefulWidget {
  const RatingApp({super.key});

  @override
  State<RatingApp> createState() => _RatingAppState();
}

class _RatingAppState extends State<RatingApp> {
  double _rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("별점")),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("별점 주셈"),
            SizedBox(height: 20,),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20,),
            Text("선택한 별점 : $_rating점")
          ],
        ),
      )
    );
  }
}

