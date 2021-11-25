import 'package:flutter/material.dart';

import 'customButton.dart';
import '../../utilities/customAlertDialog.dart';

class InfoButtonGroupWidget extends StatefulWidget {
  @override
  State<InfoButtonGroupWidget> createState() => _InfoButtonGroupWidgetState();
}

class _InfoButtonGroupWidgetState extends State<InfoButtonGroupWidget> {
  late bool showInfo;

  @override
  void initState() {
    showInfo = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showAlertDialog(
                context: context,
                title: 'Donor',
                caption:
                    'One donation can save multiple lives. Here are the facts:',
                points: [
                  'Just 1 donation can save up to 3 lives.',
                  'The average red blood cell transfusion is 3 pints (or 3 whole-blood donations).',
                  'More than 1 million people every year are diagnosed with cancer for the first time. Many of them will need blood—sometimes daily—during chemotherapy.',
                  'More than 38,000 blood donations are needed every day.',
                  'Type O-negative whole blood can be transfused to people with any blood type, but this type of blood is rare, and supplies of it are low.',
                  'Type AB plasma can be transfused to patients with all other blood types, but it\'s also in short supply.',
                ],
              );
            },
            child: CustomButton(
              iconData: Icons.group,
              caption: 'donor',
            ),
          ),
          GestureDetector(
            onTap: () {
              showAlertDialog(
                context: context,
                title: 'Patient',
                caption: ' ',
                points: [
                  'People receive blood transfusions for many reasons — such as surgery, injury, disease and bleeding disorders. Blood has several components, including: Red cells carry oxygen and help remove waste products. White cells help your body fight infections.',
                  'A blood transfusion involves taking blood from one person (the donor) and giving it to someone else. You may need a blood transfusion for a number of reasons, including: to replace blood lost during major surgery, childbirth or a severe accident.',
                  'People needing the most blood include those who are being treated for cancer, undergoing orthopedic surgeries, undergoing cardiovascular surgeries, being treated for inherited blood disorders.'
                ],
              );
            },
            child: CustomButton(
              iconData: Icons.person,
              caption: 'patient',
            ),
          ),
          GestureDetector(
            onTap: () {
              showAlertDialog(
                context: context,
                title: 'Blood Bank',
                caption: ' ',
                points: [
                  'Blood banking is the process that takes place in the lab to make sure that donated blood, or blood products, are safe before they are used in blood transfusions and other medical procedures. Blood banking includes typing the blood for transfusion and testing for infectious diseases.',
                  'Blood bank services act as the universal point as they collect, test, and store all types of blood. They carefully screen test the blood for any signs of infection. Other than screening for infections, they also check the blood type if it\'s type A, B, AB, or O and whether it\'s Rh-negative or Rh-positive.',
                ],
              );
            },
            child: CustomButton(
              iconData: Icons.account_balance_sharp,
              caption: 'blood bank',
            ),
          ),
        ],
      ),
    );
  }
}
