import 'package:flutter/material.dart';

class PatientCard extends StatefulWidget {
  @override
  _PatientCardState createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _medicalConditionController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();

  late String name, medicalCondition, bloodGroup;

  @override
  void initState() {
    name = "";
    medicalCondition = "";
    bloodGroup = "";
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
                    controller: _medicalConditionController,
                    cursorHeight: 20,
                    cursorColor: Colors.redAccent,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: "Medical Condition",
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
                        medicalCondition = input;
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
                      prefixIcon: Icon(Icons.bloodtype, color: Colors.grey.shade400),
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
                      'Register as a Patient'.toUpperCase(),
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
