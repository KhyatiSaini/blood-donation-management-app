import 'package:blood_donation_management_app/widgets/homePageComponents/signInCard.dart';
import 'package:blood_donation_management_app/widgets/homePageComponents/signUpCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool showSignIn;

  @override
  void initState() {
    showSignIn = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child:
              Image(image: AssetImage('assets/images/background.jpg'))),
          Align(alignment: Alignment.centerLeft, child: showSignIn ? SignInCard(callback: switchCard) : SignUpCard(callback: switchCard)),
        ],
      ),
    );
  }

  void switchCard(bool state) {
    setState(() {
      showSignIn = state;
    });
  }
}
