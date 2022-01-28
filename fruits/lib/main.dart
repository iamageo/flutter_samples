import 'package:flutter/material.dart';
import 'package:fruits/screens/dashboard.dart';

void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Dashboard(),
    );
  }
}
