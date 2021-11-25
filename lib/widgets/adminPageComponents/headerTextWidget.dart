import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;

  HeaderTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        letterSpacing: 1,
        overflow: TextOverflow.fade,
      ),
      textAlign: TextAlign.center,
    );
  }
}