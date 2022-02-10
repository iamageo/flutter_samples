import 'dart:ui';

class AlarmInfo {
  DateTime alarmDateTime;
  String description;
  bool isActivate;
  List<Color> gradientColor;

  AlarmInfo(this.alarmDateTime, this.description, this.isActivate, this.gradientColor);
}