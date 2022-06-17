import 'package:flutter/material.dart';
import 'package:whether_app/modules/Search.dart';
import 'package:whether_app/servise/dio_helper.dart';

void main() {
  Dio_Helper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Whether app',
        debugShowCheckedModeBanner: false,
        home: Search());
  }
}
