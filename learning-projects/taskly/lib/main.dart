import 'package:flutter/material.dart';
import 'package:taskly/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter("hive_boxes");
  runApp(Taskly());
}

class Taskly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(color: Colors.red),
      ),
      home: Home(),
    );
  }
}
