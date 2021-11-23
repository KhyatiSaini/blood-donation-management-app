import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/adminProvider.dart';
import '../widgets/bloodBankPageComponents/bloodBankCard.dart';
import '../widgets/bloodBankPageComponents/bloodBankRecordComponents/bloodBankListWidget.dart';

class BloodBankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image(image: AssetImage('assets/images/bloodbank.jpg')),
          ),
          Consumer<AdminProvider>(
            builder: (context, provider, child) {
              if (provider.adminAuthStatus) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: BloodBankCard(),
                );
              } else {
                return BloodBankListWidget(
                  displayBackButton: false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
