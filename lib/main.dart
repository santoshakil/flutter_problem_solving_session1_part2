import 'package:demo_app/model/database.dart';
import 'package:demo_app/src/demo/demo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WidgetPositionAdapter());
  await Hive.openBox<WidgetPosition>('positions');
  if (Hive.box<WidgetPosition>('positions').isEmpty) {
    Hive.box<WidgetPosition>('positions').put(
        0,
        WidgetPosition(
          left: 10,
          top: 10,
        ));
  }

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(const MaterialApp(home: KDemoClass()));
}
