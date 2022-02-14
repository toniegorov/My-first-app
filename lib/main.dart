import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My First App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Ваше Имя'),
                onChanged: (String value) {
                  _Name = value;
                  setState(() {
                    value = 'Ваше имя';
                  });
                },
              ),
            ),
          ),
          Flexible(
              child: Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Привет $_Name'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Закрыть')),
                          ],
                        );
                      });
                },
                child: Text('Поздороваться')),
          ))
        ],
      ),
    );
  }
}