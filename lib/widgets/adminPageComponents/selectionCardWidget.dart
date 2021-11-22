import 'package:flutter/material.dart';

import 'customCard.dart';
import '../../models/enums.dart';

class SelectionCardWidget extends StatelessWidget {
  final Function callback;

  SelectionCardWidget({
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 180, horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          CustomCard(
            imageAsset: 'assets/images/patient.jpg',
            caption: 'Patients',
            onTap: () => callback(adminPageWidget.patient),
          ),
          SizedBox(
            width: 40,
          ),
          CustomCard(
            imageAsset: 'assets/images/donor.jpg',
            caption: 'Donors',
            onTap: () => callback(adminPageWidget.donor),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
