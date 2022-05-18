import 'package:drawer_ex_app/receivedMail.dart';
import 'package:drawer_ex_app/sendMail.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mail'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendMail(),
                ),
              );
            },
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => receivedMail(),
                ),
              );
            },
            icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendMail(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text('보낸 편지함'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => receivedMail(),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('받은 편지함'),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
            ),
            // 밑으로 쌓인다
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SendMail(),));
              },
              leading: const Icon(
                Icons.email,
                color: Colors.blue,
              ),
              title: const Text('보낸 편지함'),
              
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/received');
              },
              leading: const Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
              title: const Text('받은 편지함'),
              
            ),
          ],
        ),
      ),   
    );
  }
}
