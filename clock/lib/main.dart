import 'package:clock/homepage.view.dart';
import 'package:clock/providers/enums.dart';
import 'package:clock/providers/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initialSettingsAndroid = AndroidInitializationSettings('launch_background');
  var initialSettingsIOS = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (int id, String title, String body, String payload) async {});

  var initialSettings = InitializationSettings(initialSettingsAndroid, initialSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initialSettings, onSelectNotification: (String payload) async {
    if(payload != null)
      debugPrint("Notification payload" + payload);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(create: (context) => MenuInfo(MenuType.clock),
        child: const HomepageView(),),
    );
  }
}
