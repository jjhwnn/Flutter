import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              //  SnackBar 생성하기
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Elevated Button is clicked'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Color.fromARGB(255, 91, 127, 156),
                ),
              );
            },
            child: const Text('Snackbar Button'),
          ),

          ElevatedButton(
          onPressed: () {
              //  SnackBar 생성하기
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Elevated Button is clicked'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.red,
                ),
              );
            },
           style: ElevatedButton.styleFrom(
             primary: Colors.red
           ),
           child: const Text('Snackbar Button'),
           ),

        ],
      ),
    );
  }
}
