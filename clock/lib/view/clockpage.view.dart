import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock.view.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split(".").first;
    var offsetSign = "";
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Text("Clock",
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(formatedTime,
                    style: const TextStyle(color: Colors.white, fontSize: 64)),
                Text(formatedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          const Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: 250,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Timezone",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                        height: 16,
                      ),
                      Text("UTC" + offsetSign + timezoneString,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
