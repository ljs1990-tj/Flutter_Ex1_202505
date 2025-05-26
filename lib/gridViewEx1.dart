import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewEx1());
}

class GridViewEx1 extends StatelessWidget {
  const GridViewEx1({super.key});

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
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                color : Colors.blue[100 * ((index % 9) + 1)],
                child: Center(child: Text("${index+1}")),
              );
            },
        )
      )
    );
  }
}


