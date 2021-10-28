import 'package:blood_donation_management_app/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Container(),
    );
  }
}