import 'package:flutter/material.dart';

class NormalTextWidget extends StatelessWidget {
  final String text;

  NormalTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.redAccent,
        letterSpacing: 1,
        overflow: TextOverflow.fade,
      ),
      textAlign: TextAlign.center,
    );
  }
}