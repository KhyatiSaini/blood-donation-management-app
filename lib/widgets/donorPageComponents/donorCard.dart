import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/donor.dart';
import '../../providers/donorProvider.dart';
import '../../providers/adminProvider.dart';

class DonorCard extends StatefulWidget {
  @override
  _DonorCardState createState() => _DonorCardState();
}

class _DonorCardState extends State<DonorCard> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _medicalReportController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  late String id, name, medicalReport, bloodGroup, contact;

  @override
  void initState() {
    id = "";
    name = "";
    medicalReport = "";
    bloodGroup = "";
    contact = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 2 * MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/register.png'),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _idController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Id",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      prefixIcon: Icon(Icons.admin_panel_settings, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        id = input;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _nameController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      prefixIcon:
                          Icon(Icons.account_box, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        name = input;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _medicalReportController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Medical Report",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      prefixIcon:
                          Icon(Icons.notes, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        medicalReport = input;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _bloodGroupController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Blood Group",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      prefixIcon:
                          Icon(Icons.bloodtype, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        bloodGroup = input;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _contactController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Contact",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      prefixIcon: Icon(Icons.mobile_friendly,
                          color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        contact = input;
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () {
                      if (_key.currentState?.validate() == true) {
                        Donor donor = Donor(int.parse(id), name, medicalReport, bloodGroup, contact, null);
                        final provider = Provider.of<DonorProvider>(context, listen: false);
                        provider.createDonor(donor.toJson());

                        _idController.text = "";
                        _nameController.text = "";
                        _contactController.text = "";
                        _bloodGroupController.text = "";
                        _medicalReportController.text = "";
                      }
                    },
                    color: Colors.redAccent,
                    minWidth: double.infinity,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Consumer<AdminProvider>(
                        builder: (context, provider, child) {
                      return Text(
                        (provider.adminAuthStatus)
                            ? 'Save donor details'.toUpperCase()
                            : 'Register as a Donor'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
