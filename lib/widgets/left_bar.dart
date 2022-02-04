// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bmi/constants/app_constants.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: accentColor
          ),
        ),
      ],
    );
  }
}
