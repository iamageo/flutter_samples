import 'package:clock/providers/enums.dart';
import 'package:clock/providers/menu_info.dart';
import 'package:flutter/material.dart';

List<MenuInfo> listMenu = [
  MenuInfo(MenuType.clock, title: "Clock", icon: Icons.timelapse),
  MenuInfo(MenuType.alarm, title: "Alarm", icon: Icons.alarm),
  MenuInfo(MenuType.timer, title: "About", icon: Icons.info),
];
