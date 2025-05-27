import 'package:flutter/material.dart';

void main() {
  runApp(GridViewEx2());
}

class GridViewEx2 extends StatelessWidget {
  GridViewEx2({super.key});
  List<String> path = ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg", "iu1.jpg", "iu2.jpg"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
            body : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemCount: path.length,
              itemBuilder: (context, index) {
                return Container(
                  padding : EdgeInsets.all(10),
                  child: Image.asset(path[index], fit : BoxFit.fill)
                );
              },
            )
        )
    );
  }
}


