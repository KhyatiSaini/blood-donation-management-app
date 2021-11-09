import 'package:blood_donation_management_app/widgets/adminPageComponents/adminCard.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child:Align(
          alignment: Alignment.center,
          child: AdminCard()
      ),
    );
  }
}