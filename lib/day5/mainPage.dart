import 'package:flutter/material.dart';
import 'aPage.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: APage(),
    );
  }
}

