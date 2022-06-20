import 'package:flutter/material.dart';
import 'package:flutter_textfield_input_formatter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField Input Formatter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Input Formatter'),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: const HomePage(),
      ),
    );
  }
}
