import 'package:clock/providers/alarm_info.dart';
import 'package:clock/providers/enums.dart';
import 'package:clock/providers/menu_info.dart';
import 'package:flutter/material.dart';

List<MenuInfo> listMenu = [
  MenuInfo(MenuType.clock, title: "Clock", icon: Icons.timelapse),
  MenuInfo(MenuType.alarm, title: "Alarm", icon: Icons.alarm),
  MenuInfo(MenuType.timer, title: "Timer", icon: Icons.timer),
];

List<AlarmInfo> listAlarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), "Office", true),
];
