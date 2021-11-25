import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'recordHeaderRow.dart';
import 'addRecordWidget.dart';
import 'recordRowContainer.dart';
import '../../../models/enums.dart';
import '../../../models/donation.dart';
import '../../../providers/donationProvider.dart';

class DonationRecordWidget extends StatelessWidget {
  final Function callback;

  DonationRecordWidget({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.redAccent,
                    child: IconButton(
                      onPressed: () {
                        callback(AdminPageWidget.selection);
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
                    'Donation records'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 1,
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                width: 1500,
                child: Column(
                  children: [
                    AddRecordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    RecordHeaderRow(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Consumer<DonationProvider>(
                        builder: (context, provider, child) {
                          provider.fetchDonations();
                          final bool isListFetched = provider.isListFetched;
                          List<Donation> donations = [];
                          if (isListFetched) {
                            donations = provider.donations;
                          }

                          return (isListFetched) ? ListView.builder(
                            itemBuilder: (context, index) {
                              return RecordRowContainer(
                                donorId: donations[index].donorId.toString(),
                                patientId:
                                    donations[index].patientId.toString(),
                                bloodBank: donations[index].bloodBank,
                                date: donations[index].date.substring(0, 10),
                              );
                            },
                            itemCount: donations.length,
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
