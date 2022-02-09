import 'dart:io';

import 'package:clock/data.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
        child: Expanded(
          child: ListView(
            children: listAlarms.map((alarm) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.red],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.label,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Office",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Switch(
                              value: true,
                              onChanged: (bool value) {},
                              activeColor: Colors.white,
                            ),
                          ],
                        ),
                        const Text("Mon-fry", style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
