import 'package:flutter/material.dart';

class AppBarTitleContainer extends StatelessWidget {
  final String text;
  const AppBarTitleContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade300,
          fontSize: 20,
        ),
      ),
    );
  }
}
