import 'package:flutter/material.dart';

class BloodBankCard extends StatefulWidget {
  @override
  _BloodBankCardState createState() => _BloodBankCardState();
}

class _BloodBankCardState extends State<BloodBankCard> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _staffDetailsController = TextEditingController();
  TextEditingController _operatingHoursController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  late String name, staffDetails, operatingHours, address;

  @override
  void initState() {
    name = "";
    staffDetails = "";
    operatingHours = "";
    address = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
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
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/register.png'),
                  SizedBox(height: 25),
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
                      prefixIcon: Icon(Icons.account_box, color: Colors.grey.shade400),
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
                    controller: _staffDetailsController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: "Staff Details",
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
                      prefixIcon: Icon(Icons.notes, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        staffDetails = input;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _operatingHoursController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Operating Hours",
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
                      prefixIcon: Icon(Icons.timelapse_outlined, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        operatingHours = input;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _addressController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      hintText: "Address",
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
                      prefixIcon: Icon(Icons.home_work, color: Colors.grey.shade400),
                    ),
                    validator: (input) {
                      if (input!.isEmpty || input.trim().length == 0) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (input) {
                      setState(() {
                        address = input;
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () {
                      // TODO: validate the form fields and save the details to database
                      if (_key.currentState?.validate() == true) {

                      }
                    },
                    color: Colors.redAccent,
                    minWidth: double.infinity,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Save blood bank details'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontSize: 18, letterSpacing: 1),
                    ),
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
