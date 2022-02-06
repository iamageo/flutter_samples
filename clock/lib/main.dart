import 'package:clock/homepage.view.dart';
import 'package:clock/providers/enums.dart';
import 'package:clock/providers/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(create: (context) => MenuInfo(MenuType.clock),
        child: const HomepageView(),),
    );
  }
}
