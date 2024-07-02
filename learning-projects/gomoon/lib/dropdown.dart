import 'package:flutter/material.dart';
import './home.dart';

class CustomDropdown extends StatelessWidget {
  List<String> values;
  double width;
  CustomDropdown({required this.values, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(color: Color.fromARGB(255, 42, 42, 42)),
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: DropdownButton<String>(
        value: values.first,
        underline: Container(),
        style: TextStyle(color: Colors.white),
        dropdownColor: Colors.black,
        items: values.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}
