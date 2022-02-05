import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock.view.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split(".").first;
    var offsetSign = "";
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton("Clock", Icons.timelapse),
              buildMenuButton("Alarm", Icons.alarm),
              buildMenuButton("Timer", Icons.timer),
            ],
          ),
          const VerticalDivider(
            color: Colors.white,
            width: 2,
          ),
          Expanded(
            child: Container(
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 64)),
                        Text(formatedDate,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(size: 250,),
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Timezone",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
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
            ),
          )
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: FlatButton(
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          )),
    );
  }
}
