import 'package:flutter/material.dart';

void main() {
  runApp(const FlexEx1());
}
class FlexEx1 extends StatelessWidget {
  const FlexEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,),
        drawer: Drawer(),
        body : Row(
          children: [
            Flexible(child: Container(color: Colors.yellow,), flex : 1),
            Flexible(child: Column(
              children: [
                Flexible(child: Container(color: Colors.green,)),
                Flexible(child: Container(color: Colors.orange,)),
                Flexible(child: Container(color: Colors.grey,))
              ],
            ), flex : 2,),
            Flexible(child: Container(color: Colors.purple), flex : 1,)

          ],
        ),
        bottomNavigationBar: BottomAppBar(color : Colors.grey[300]),
      )
    );
  }
}
