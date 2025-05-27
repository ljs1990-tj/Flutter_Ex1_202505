import 'package:flutter/material.dart';

void main() {
  runApp(const Calc());
}

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  List<String> labels = [
    'C', '(', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '00', '.', '='
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title : Text("계산기")),
        body : Column(
          children: [
            SizedBox(
              height: 100,
              child: TextField(),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6
                  ),
                  itemCount: labels.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                        onPressed: (){},
                        child: Text(labels[index]),
                        style : ElevatedButton.styleFrom(
                          backgroundColor: (index+1) % 4 == 0 ? Colors.blue[300] : Colors.grey[100],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                          )

                        )
                    );
                  },
              ),
            )
            
            
          ],
        )
      )
    );
  }
}
