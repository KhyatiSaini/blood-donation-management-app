import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'customCard.dart';

class AdminWidget extends StatelessWidget {
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
            onTap: testApi,
          ),
          SizedBox(
            width: 40,
          ),
          CustomCard(
            imageAsset: 'assets/images/donor.jpg',
            caption: 'Donors',
            onTap: testApi,
          ),
          Spacer(),
        ],
      ),
    );
  }

  void testApi() async {
    Uri uri = Uri.parse('http://localhost:3000/test/');
    final response = await get(
      uri,
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
    );
    final json = jsonDecode(response.body);
    print('${response.statusCode} $json');
  }
}
