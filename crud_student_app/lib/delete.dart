import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Delete extends StatefulWidget {
  final Map profile;

  const Delete({Key? key, required this.profile}) : super(key: key);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {

//property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;
 
 @override
  void initState() {
    super.initState();
    codeController =TextEditingController();
    nameController =TextEditingController();
    deptController =TextEditingController();
    phoneController =TextEditingController();


    codeController.text = widget.profile['code'];
    nameController.text = widget.profile['name'];
    deptController.text = widget.profile['dept'];
    phoneController.text = widget.profile['phone'];

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Delete for CRUD'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '학번 입니다.',
                ),
                readOnly: true,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '성명 입니다.',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '전공 입니다.',
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호 입니다.',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: (){
                code=codeController.text;
                name=nameController.text;
                dept=deptController.text;
                phone=phoneController.text;
               deleteAction();
              }, 
              child:const Text('삭제'),
              ),
    
            ],
        ),
          ),
        )
    
    
      ),
    );
  }
deleteAction() async{
  var url =Uri.parse(
    'http://localhost:8080/Flutter/student_delete_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone'
  );
  var response =await http.get(url);
  setState(() {
    var dataConvertedJSON =json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];
    if(result=='OK'){
      _showDialog(context);

    }else{
      errorSnackBar(context);
    }
  });
}
_showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('삭제 결과'),
            content: const Text('삭제가 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
errorSnackBar(BuildContext context){
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content:  Text('사용자 정보 입력에 문제가 발생하였습니다.'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
  ),);
}


}//end