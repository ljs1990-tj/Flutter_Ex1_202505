import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(ImgApp());

class ImgApp extends StatelessWidget {
  const ImgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : ImgExam()
    );
  }
}

class ImgExam extends StatefulWidget {
  const ImgExam({super.key});

  @override
  State<ImgExam> createState() => _ImgExamState();
}

class _ImgExamState extends State<ImgExam> {
  File? _image ;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImg() async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // 이미지 선택 시 _image 변수에 저장
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> getCameraImg() async{
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        // 이미지 선택 시 _image 변수에 저장
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {


    try {
      var storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(_image!);

      var downloadUrl = await storageRef.getDownloadURL();

      print("다운로드 주소: $downloadUrl");
    } catch (e) {
      print("에러");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("이미지 선택")),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
            ? Text("선택된 이미지 없음")
            : Image.file(
                _image!,
              width: 200, height: 200, fit : BoxFit.cover),
            ElevatedButton(
                onPressed: getImg,
                child: Text("이미지 선택")
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: getCameraImg,
                child: Text("카메라로 촬영")
            )
          ],
        ),
      )
    );
  }
}

