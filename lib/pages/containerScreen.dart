import 'package:blood_donation_management_app/pages/adminPage.dart';
import 'package:blood_donation_management_app/pages/bloodBankPage.dart';
import 'package:blood_donation_management_app/pages/donorPage.dart';
import 'package:blood_donation_management_app/pages/homePage.dart';
import 'package:blood_donation_management_app/pages/patientPage.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation_management_app/widgets/appBar.dart';

class ContainerScreen extends StatefulWidget {
  static final String routeName = '/container';

  @override
  _ContainerScreenState createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  late Widget currentPage;
  List pages = [HomePage(), DonorPage(), PatientPage(), BloodBankPage(), AdminPage()];

  @override
  void initState() {
   currentPage = pages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(changePage),
      ),
      body: currentPage,
    );
  }

  void changePage(int index) {
    setState(() {
      currentPage = pages[index];
    });
  }
}