import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloodBankHeaderRow.dart';
import '../../../models/enums.dart';
import 'bloodBankRowContainer.dart';
import '../../../models/bloodBank.dart';
import '../../../providers/bloodBankProvider.dart';

class BloodBankListWidget extends StatelessWidget {
  final bool displayBackButton;
  final Function? callback;

  BloodBankListWidget({
    required this.displayBackButton,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (displayBackButton)
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20, top: 20),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.redAccent,
                  child: IconButton(
                    onPressed: () {
                      callback!(AdminPageWidget.selection);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Blood Banks'.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1,
                  color: Colors.blueGrey.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 1500,
                child: Column(
                  children: [
                    BloodBankHeaderRow(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Consumer<BloodBankProvider>(
                        builder: (context, bloodBankProvider, child) {
                          bloodBankProvider.fetchBloodBanks();
                          final bool isListFetched =
                              bloodBankProvider.isListFetched;
                          List<BloodBank> bloodBanks = [];

                          if (isListFetched) {
                            bloodBanks = bloodBankProvider.bloodBanks;
                          }

                          return (isListFetched) ? ListView.builder(
                            itemBuilder: (context, index) {
                              return BloodBankRowContainer(
                                name: bloodBanks[index].name,
                                staffDetails:
                                    bloodBanks[index].staffDetails.toString(),
                                operatingHours:
                                    bloodBanks[index].operatingHours,
                                address: bloodBanks[index].address,
                              );
                            },
                            itemCount: bloodBanks.length,
                          ) : Center(
                            child: CircularProgressIndicator(
                              color: Colors.redAccent,
                              strokeWidth: 5,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
