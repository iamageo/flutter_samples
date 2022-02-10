import 'package:clock/constants/constants.dart';
import 'package:clock/data.dart';
import 'package:dotted_border/dotted_border.dart';
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
            children: listAlarms.map<Widget>((alarm) {
              return Container(
                margin: const EdgeInsets.only(bottom: 32),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: alarm.gradientColor,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: alarm.gradientColor.last.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(4, 4))
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
                            Text(
                              alarm.description,
                              style: const TextStyle(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Mon-Fry",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "07:00 AM",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 26,
                        )
                      ],
                    )
                  ],
                ),
              );
            }).followedBy([
              DottedBorder(
                dashPattern: const [5, 4],
                color: CustomColors.clockOutline,
                strokeWidth: 3,
                borderType: BorderType.RRect,
                radius: const Radius.circular(24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    color: CustomColors.clockBG,
                  ),
                  height: 100,
                  child: FlatButton(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      onPressed: () {},
                      child: Column(
                        children: const <Widget>[
                          Icon(
                            Icons.add,
                            size: 24,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Add alarm")
                        ],
                      ))))
            ]).toList(),
          ),
        ));
  }
}
