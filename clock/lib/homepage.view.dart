import 'package:flutter/material.dart';

import 'clock.view.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xFF2D2F41),
        child: ClockView(),
      ),
    );
  }
}
