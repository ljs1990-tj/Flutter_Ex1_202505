import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(SlidableApp());

class SlidableApp extends StatelessWidget {
  const SlidableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : SlidableExam()
    );
  }
}

class SlidableExam extends StatelessWidget {
  List<String> list = ['자바', '오라클', 'HTML', '플러터'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slidable 리스트')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(list[index]),
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${list[index]} 편집 됨"))
                    );
                  },
                  backgroundColor: Colors.blue,
                  icon: Icons.edit,
                  label: '편집',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${list[index]} 삭제 됨"))
                    );
                  },
                  backgroundColor: Colors.purple,
                  icon: Icons.delete,
                  label: '삭제',
                ),
              ],
            ),
            child: ListTile(
              title: Text(list[index]),
            ),
          );
        },
      ),
    );
  }
}
