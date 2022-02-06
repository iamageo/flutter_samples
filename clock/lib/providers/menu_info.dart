import 'package:clock/providers/enums.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  IconData? icon;

  MenuInfo(this.menuType, {this.title, this.icon});

  updateMenuInfo(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.icon = menuInfo.icon;

    notifyListeners();
  }

}