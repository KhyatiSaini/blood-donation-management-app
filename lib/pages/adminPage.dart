import 'package:flutter/material.dart';

import '../widgets/adminPageComponents/adminWidget.dart';
import '../widgets/adminPageComponents/adminLoginCard.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: AdminWidget(),
      ),
    );
  }
}
