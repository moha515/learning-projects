import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restHnadler;
  Result(this.resultScore, this.restHnadler);
  String get resultPhrase {
    String resulttext = "niceeeeeeeee";
    if (resultScore <= 10) {
      resulttext = 'goooood job';
    } else if (resultScore <= 20) {
      resulttext = 'cooooool';
    } else if (resultScore <= 40) {
      resulttext = '-_________-';
    } else {
      resulttext = 'u R Done';
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
          ),
        ),
        FloatingActionButton(child: Text('Rstart'), onPressed: restHnadler)
      ],
    );
  }
}
