import 'package:flutter/material.dart';

import 'homePage.dart';
import 'adminPage.dart';
import 'donorPage.dart';
import 'patientPage.dart';
import 'bloodBankPage.dart';
import '../widgets/appBar.dart';

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