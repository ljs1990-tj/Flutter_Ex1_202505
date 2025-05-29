import 'package:flutter/material.dart';

import '../common/db.dart';

class UserEdit extends StatefulWidget {
  int userId;
  UserEdit({super.key, required this.userId});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  Future<void> _loadUser() async {
    var user = await DB.loadUser(widget.userId);
    var userInfo = user.first;
    setState(() {
      nameCtrl.text = userInfo["NAME"];
      ageCtrl.text = userInfo["AGE"].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Text("사용자 수정"),
        ),
        body : Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                    labelText: "Name"
                ),
              ),
              TextField(
                controller: ageCtrl,
                decoration: InputDecoration(
                    labelText: "Age"
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    DB.updateUser(widget.userId, nameCtrl.text, int.tryParse(ageCtrl.text)!);
                    Navigator.pop(context, true);
                  },
                  child: Text("수정")
              )
            ],
          ),
        )

    );
  }
}
