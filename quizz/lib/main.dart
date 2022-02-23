import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz/screens/welcome/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Welcome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
