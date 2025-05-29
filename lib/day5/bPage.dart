import 'package:flutter/material.dart';

void main() => runApp(BPage());

class BPage extends StatelessWidget {
  final String? message;
  const BPage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title : Text("B 페이지")),
        body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message ?? "B 페이지"),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("이전 페이지로 이동")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context, "B가 보낸다");
                  },
                  child: Text("값 포함 이전 페이지로 이동")
              )
            ],
          ),
        )
    );
  }
}

