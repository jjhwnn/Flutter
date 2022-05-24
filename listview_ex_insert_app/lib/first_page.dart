import 'package:flutter/material.dart';
import 'package:listview_ex_insert_app/country.dart';

class FirstPage extends StatefulWidget {
  final List<Country> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showCountryName(context, widget.list[index]);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[index].countryImagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                          '${widget.list[index].countryName.substring(0, 1)}${' _ ' * (widget.list[index].countryName.length - 1)}'),
                    ],
                  ),
                ),
              );
            }));
  }

  _showCountryName(BuildContext context, Country country) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('국가명'),
          content: Text('이 국기는 ${country.countryName}입니다.'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('종료'))
          ],
        );
      });
  }
}
