import 'package:flutter/material.dart';

void main() {
  runApp(const DropDownEx1());
}
class DropDownEx1 extends StatefulWidget {
  const DropDownEx1({super.key});

  @override
  State<DropDownEx1> createState() => _DropDownEx1State();
}

class _DropDownEx1State extends State<DropDownEx1> {
  String selectItem = "Java";
  List<String> list = ["Java", "Oracle", "Html/CSS", "Flutter"];
  Map<String, String> map = {
    "Java" : "java.jpg",
    "Oracle" : "oracle.jpg",
    "Html/CSS" : "html.jpg",
    "Flutter" : "jquery.jpg"
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                  value : selectItem,
                  icon: Icon(Icons.arrow_downward),
                  style: TextStyle(color : Colors.blue),
                  items: list.map((String item){
                    return DropdownMenuItem(
                        value : item,
                        child: Text(item)
                    );
                  }).toList(),
                  onChanged: (String? value){
                    setState(() {
                      selectItem = value!;
                    });
                  }
              ),
              Container(height: 10,),
              Image.asset(map[selectItem]!)
              // Text("선택한 과목 : $selectItem"),
            ],
          ),
        )
      )
    );
  }
}
