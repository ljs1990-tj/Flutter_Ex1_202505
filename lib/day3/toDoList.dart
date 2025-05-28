import 'package:flutter/material.dart';

void main() => runApp(ToDoList());

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : ToDoManager()
    );
  }
}

class ToDoManager extends StatefulWidget {
  const ToDoManager({super.key});

  @override
  State<ToDoManager> createState() => _ToDoManagerState();
}

class _ToDoManagerState extends State<ToDoManager> {
  TextEditingController txtCtrl = TextEditingController();
  List<Map<String, Object>> list = [];

  void addToDo(){
    String title = txtCtrl.text;
    setState(() {
      list.add({"title" : title, "isDone" : false});
      txtCtrl.clear();
    });
  }

  void deleteTodo(int index){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title : Text("삭제"),
          content: Text("정말 삭제 하실?"),
          actions: [
            TextButton(
                onPressed: (){
                  setState(() {
                    list.removeAt(index);
                  });
                  Navigator.of(context).pop();
                },
                child: Text("삭제")
            ),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("취소")
            )
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title : Text("할 일"),
          centerTitle: true,
      ),
      body : Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: txtCtrl,
                    decoration: InputDecoration(
                      hintText: "할 일 입력 하셔"
                    ),
                  )
              ),
              SizedBox(width: 20,),
              ElevatedButton(
                  onPressed: addToDo,
                  child: Text("추가")
              )
            ],
          ),
          Expanded(
              child: list.isEmpty
                  ? Center(child: Text("할 일 없음"),)
                  : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Map item = list[index];
                      return ListTile(
                        title : Text(
                            item["title"],
                            style : TextStyle(
                              decoration: item["isDone"] ? TextDecoration.lineThrough : null,
                            )
                        ),
                        leading: Checkbox(
                            value: item["isDone"],
                            onChanged: (value) {
                              setState(() {
                                item["isDone"] = value;
                              });
                            },
                        ),
                        trailing: IconButton(
                            onPressed: () => deleteTodo(index),
                            icon: Icon(Icons.delete)
                        ),
                      );
                    },
                )

          )
        ],
      )
    );
  }
}

