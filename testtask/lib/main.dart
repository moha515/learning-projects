import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testtask/firebase_options.dart';
import 'package:testtask/home.dart';

void main() async{ WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( TaskApp());
}
class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Taskly.id: (context) => Taskly(),
      },
      initialRoute: Taskly.id,
    );
  }
}