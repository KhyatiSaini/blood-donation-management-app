import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/adminProvider.dart';
import '../widgets/adminPageComponents/adminWidget.dart';
import '../widgets/adminPageComponents/adminLoginCard.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Consumer<AdminProvider>(
        builder: (context, provider, child) {
          return Align(
            alignment: Alignment.center,
            child: (provider.adminAuthStatus) ? AdminWidget() : AdminLoginCard(),
          );
        }
      ),
    );
  }
}
