import 'package:blood_donation_management_app/models/enums.dart';
import 'package:flutter/material.dart';

class PatientsListWidget extends StatelessWidget {
  final Function callback;

  PatientsListWidget({
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 20),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.redAccent,
              child: IconButton(
                onPressed: () => callback(adminPageWidget.selection),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            'patients record'.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              color: Colors.blueGrey.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
