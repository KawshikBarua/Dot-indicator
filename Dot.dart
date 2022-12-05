import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  final int steps;
  Color activeColor;
  Color remainingColor;
  int stepNum;

  Dot(
      {Key? key,
      required this.steps,
      this.activeColor = Colors.amberAccent,
      this.remainingColor = Colors.grey,
      this.stepNum = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < steps; i++) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.circle,
          color: i < stepNum ? activeColor : remainingColor,
          size: 16.0,
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets.map((e) => e).toList(),
    );
  }
}
