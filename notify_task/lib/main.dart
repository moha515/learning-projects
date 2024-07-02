import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notify_task/firebase_options.dart';
import 'package:notify_task/screens/task_screen.dart';
import 'package:notify_task/screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        Taskly.id: (context) => Taskly(),
      },
      initialRoute: Taskly.id,
    );
  }
}
