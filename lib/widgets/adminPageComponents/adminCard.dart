import 'package:flutter/material.dart';

class AdminCard extends StatefulWidget {
  @override
  _AdminCardState createState() => _AdminCardState();
}

class _AdminCardState extends State<AdminCard> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _adminTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late bool showPassword;

  late String admin;
  late String password;

  @override
  void initState() {
    showPassword = false;
    admin = "";
    password = "";
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
          child: Column(
            children: [
              Spacer(),
              Image.asset('assets/images/admin.png'),
              SizedBox(height: 25),
              TextFormField(
                controller: _adminTextController,
                cursorHeight: 20,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "Admin",
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
                  prefixIcon: Icon(Icons.email, color: Colors.grey.shade400),
                ),
                validator: (input) {
                  if (input!.isEmpty || input.trim().length == 0) {
                    return "This field is required";
                  }
                  return null;
                },
                onChanged: (input) {
                  setState(() {
                    admin = input;
                  });
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordTextController,
                cursorHeight: 20,
                cursorColor: Colors.redAccent,
                obscureText: !showPassword,
                decoration: InputDecoration(
                    hintText: "Password",
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
                    prefixIcon: Icon(Icons.lock, color: Colors.grey.shade400),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: showPassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility,
                            color: Colors.grey.shade400))),
                validator: (input) {
                  if (input!.isEmpty || input.trim().length == 0) {
                    return "This field is required";
                  } else if (input.trim().length < 6) {
                    return "Password too short!";
                  }
                  return null;
                },
                onChanged: (input) {
                  setState(() {
                    password = input;
                  });
                },
              ),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  // TODO: validate the form fields and authenticate the user
                  if (_key.currentState?.validate() == true) {

                  }
                },
                color: Colors.redAccent,
                minWidth: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Log in'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, letterSpacing: 1),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
