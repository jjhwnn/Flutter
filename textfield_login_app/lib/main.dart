import 'package:flutter/material.dart';
import 'package:textfield_login_app/animal/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController id;
  late TextEditingController pw;
  late bool check;

  @override
  void initState() {
    id = TextEditingController();
    pw = TextEditingController();
    check = false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log In'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 90,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: id,
                decoration: const InputDecoration(labelText: '사용자 ID를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: pw,
                decoration:
                    const InputDecoration(labelText: '사용자 Password를 입력하세요'),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //  아이디 비밀번호 체크
                      loginCheck();
                    });
                  },
                  child: const Text('Log In'))
            ],
          ),
        ),
      ),
    );
  }

  loginCheck() {
    if (id.text == '' || pw.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('사용자 ID와 암호를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    } else if (id.text != 'root' || pw.text != 'qwer1234') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('로그인에 실패하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ));
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('환영 합니다!'),
              content: const Text('신분이 확인 되었습니다.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, 
                        MaterialPageRoute(
                        builder: (context) => const MainPage()),);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
  }
}
