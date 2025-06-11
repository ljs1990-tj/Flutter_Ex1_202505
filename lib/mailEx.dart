import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Send Email'),
        ),
        body: SendEmailScreen(),
      ),
    );
  }
}

class SendEmailScreen extends StatefulWidget {
  @override
  _SendEmailScreenState createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: '이메일 주소',
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _sendEmail(_emailController.text);
            },
            child: Text('이메일 보내기'),
          ),
        ],
      ),
    );
  }

  void _sendEmail(String recipient) async {
    // Gmail SMTP 서버 설정
    final smtpServer = gmail('gmail 메일주소', '앱 비밀번호');

    // 난수 생성
    String randomCode = _generateRandomCode();

    // 메일 내용
    final message = Message()
      ..from = Address('your_email@gmail.com', 'Your Name')
      ..recipients.add(recipient)
      ..subject = '인증 코드'
      ..text = '인증 코드: $randomCode';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      // 성공적으로 이메일이 전송된 후에는 사용자에게 메시지를 표시할 수 있습니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('이메일이 성공적으로 전송되었습니다.'),
        ),
      );
    } catch (e) {
      print('Error: $e');
      // 이메일 전송 중 오류가 발생한 경우 사용자에게 오류 메시지를 표시할 수 있습니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('이메일을 전송하는 동안 오류가 발생했습니다.'),
        ),
      );
    }
  }

  String _generateRandomCode() {
    const chars = '0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}