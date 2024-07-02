import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback _selectHandler;
  final String answertxt;
  const Answer(this._selectHandler, this.answertxt);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: (ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            textStyle: TextStyle(color: Colors.white))),
        child: Text(answertxt),
        onPressed: _selectHandler,
      ),
    );
  }
}
