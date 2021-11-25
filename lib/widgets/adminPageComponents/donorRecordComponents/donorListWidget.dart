import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'donorHeaderRow.dart';
import 'donorRowContainer.dart';
import '../../../models/donor.dart';
import '../../../models/enums.dart';
import '../../../providers/donorProvider.dart';

class DonorListWidget extends StatelessWidget {
  final Function callback;

  DonorListWidget({
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
                child: IconButton(
                  onPressed: () => callback(AdminPageWidget.selection),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Text(
              'donors record'.toUpperCase(),
              style: TextStyle(
                fontSize: 30,
                letterSpacing: 1,
                color: Colors.blueGrey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: 1500,
                child: Column(
                  children: [
                    DonorHeaderRow(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Consumer<DonorProvider>(
                          builder: (context, donorProvider, child) {
                        donorProvider.fetchDonors();
                        final bool isListFetched = donorProvider.isListFetched;
                        List<Donor> donors = [];

                        if (isListFetched) {
                          donors = donorProvider.donors;
                        }

                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return DonorRowContainer(
                              id: donors[index].id.toString(),
                              name: donors[index].name,
                              medicalReport: donors[index].medicalReport,
                              bloodGroup: donors[index].bloodGroup,
                              contactNumber: donors[index].contactNumber,
                              latestDonationDate:
                                  (donors[index].latestDonationDate != null)
                                      ? donors[index]
                                          .latestDonationDate!
                                          .substring(0, 10)
                                      : "-",
                            );
                          },
                          itemCount: donors.length,
                        );
                      }),
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
