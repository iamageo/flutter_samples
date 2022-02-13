import 'package:clock/constants/constants.dart';
import 'package:clock/providers/enums.dart';
import 'package:clock/providers/menu_info.dart';
import 'package:clock/view/alarm.view.dart';
import 'package:clock/view/clockpage.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({Key? key}) : super(key: key);

  @override
  _HomepageViewState createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Consumer<MenuInfo>(builder:
                  (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                } else {
                  return RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 20),
                      children:  <TextSpan>[
                        const TextSpan(text: 'Upcoming Tutorial\n'),
                        TextSpan(
                          text: value.title,
                          style: TextStyle(fontSize: 48),
                        ),
                      ],
                    ),
                  );
                }
              }),
            ),
          ],
        ));
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
