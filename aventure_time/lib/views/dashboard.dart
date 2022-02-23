import 'package:aventure_time/components/card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MCU APP",
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 3),
              ),
              Text(
                "Super heroes",
                style: TextStyle(fontSize: 24, letterSpacing: 3),
              ),
              Expanded(
                child: const CardHero(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
