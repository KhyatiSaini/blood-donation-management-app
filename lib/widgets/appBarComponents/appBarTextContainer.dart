import 'package:flutter/material.dart';

class AppBarTextContainer extends StatelessWidget {
  final String text;
  final Color color;
  const AppBarTextContainer(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text.toUpperCase(),
        style:
            TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: color),
      ),
    );
  }
}
