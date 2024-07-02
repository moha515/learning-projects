import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendigPTotal;
  ChartBar(
    this.label,
    this.spendingAmount,
    this.spendigPTotal,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 11,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white),
              ),
              FractionallySizedBox(
                heightFactor: spendigPTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
