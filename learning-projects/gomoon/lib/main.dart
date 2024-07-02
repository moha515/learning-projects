import 'package:flutter/material.dart';
import 'package:gomoon/home.dart';

void main() {
  runApp(goMoon());
}

class goMoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomoon',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(40, 40, 40, 32)),
      home: HomePage(),
    );
  }
}
