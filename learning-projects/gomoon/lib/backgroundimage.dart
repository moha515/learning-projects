import 'package:flutter/material.dart';

class ImageBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //color: Colors.grey,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/50744785952_637936097b.jpg"))),
    );
  }
}
