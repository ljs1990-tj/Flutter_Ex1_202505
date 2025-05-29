import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(AniApp());

class AniApp extends StatelessWidget {
  const AniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : AniExam()
    );
  }
}

class AniExam extends StatelessWidget {
  const AniExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("오픈 컨테이너")),
      body : Center(
        child: OpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: Duration(milliseconds: 500),
            closedBuilder: (context, action) {
              return ElevatedButton(
                  onPressed: action,
                  child: Text("상세보기")
              );
            },
            openBuilder: (context, action) => DetailView(),
        ),
      )
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("상세보기")),
      body : Center(child: Text("상세보기 페이지!"),)
    );
  }
}


