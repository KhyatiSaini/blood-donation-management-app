import 'package:blood_donation_management_app/providers/adminProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/adminPageComponents/adminWidget.dart';
import '../widgets/adminPageComponents/adminLoginCard.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: (provider.adminAuthStatus) ? AdminWidget() : AdminLoginCard(),
      ),
    );
  }
}
