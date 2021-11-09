import 'package:flutter/material.dart';

class SignInCard extends StatefulWidget {
  final Function callback;
  const SignInCard({required this.callback});

  @override
  _SignInCardState createState() => _SignInCardState();
}

class _SignInCardState extends State<SignInCard> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  late bool showPassword;

  bool emailValidator(String mail) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(mail);
  }

  @override
  void initState() {
    showPassword = false;
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
              Image.asset('assets/images/signin.png'),
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
              ),
              SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  // TODO: validate the form fields and authenticate the user
                  _key.currentState?.validate();
                  print('sign in');
                },
                color: Colors.redAccent,
                minWidth: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Sign In'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, letterSpacing: 1),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  widget.callback(false);
                },
                child: Text(
                  'Don\'t have an account? Create one!',
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
