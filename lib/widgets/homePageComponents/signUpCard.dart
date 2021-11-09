import 'package:flutter/material.dart';

class SignUpCard extends StatefulWidget {
  final Function callback;
  const SignUpCard({required this.callback});

  @override
  _SignUpCardState createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late bool showPassword;

  late String email;
  late String password;

  bool emailValidator(String mail) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(mail);
  }

  @override
  void initState() {
    showPassword = false;
    email = "";
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
              Image.asset('assets/images/signup.png'),
              SizedBox(height: 25),
              TextFormField(
                controller: _emailTextController,
                cursorHeight: 20,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  hintText: "Email",
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
                  } else if (!emailValidator(input)) {
                    return "Enter a valid email address";
                  }
                  return null;
                },
                onChanged: (input) {
                  setState(() {
                    email = input;
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
                  print('sign up');
                },
                color: Colors.redAccent,
                minWidth: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Sign up'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, letterSpacing: 1),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  widget.callback(true);
                },
                child: Text(
                  'Already have an account? Sign in here!',
                  style: TextStyle(color: Colors.redAccent),
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
