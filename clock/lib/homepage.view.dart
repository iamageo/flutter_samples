import 'package:clock/constants/constants.dart';
import 'package:clock/providers/enums.dart';
import 'package:clock/providers/menu_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'clock.view.dart';
import 'data.dart';

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
            children: listMenu
                .map((currentMenuItem) => buildMenuButton(currentMenuItem))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white,
            width: 2,
          ),
          Expanded(child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if(value.menuType != MenuType.clock) return Container();
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
            );
          }))
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return FlatButton(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: currentMenuInfo.menuType == value.menuType
                ? CustomColors.menuBackgroundColor
                : Colors.transparent,
            onPressed: () {
              var menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenuInfo(currentMenuInfo);
            },
            child: Column(
              children: [
                Icon(
                  currentMenuInfo.icon,
                  color: Colors.white,
                ),
                Text(
                  currentMenuInfo.title ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ));
      },
    );
  }
}
