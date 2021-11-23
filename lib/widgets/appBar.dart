import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/adminProvider.dart';
import 'appBarComponents/appBarTextContainer.dart';
import 'appBarComponents/appBarTitleContainer.dart';

class CustomAppBar extends StatefulWidget {
  final Function callback;
  const CustomAppBar(this.callback);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey.shade900,
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBarTitleContainer('Blood Donation Management'),
              SizedBox(width: 15),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                    widget.callback(index);
                  },
                  child: AppBarTextContainer(
                      'Home', index == 0 ? Colors.grey.shade300 : Colors.grey)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                    widget.callback(index);
                  },
                  child: AppBarTextContainer('Donor',
                      index == 1 ? Colors.grey.shade300 : Colors.grey)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                    });
                    widget.callback(index);
                  },
                  child: AppBarTextContainer('Patient',
                      index == 2 ? Colors.grey.shade300 : Colors.grey)),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 3;
                    });
                    widget.callback(index);
                  },
                  child: AppBarTextContainer('Blood Bank',
                      index == 3 ? Colors.grey.shade300 : Colors.grey)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                  });
                  widget.callback(index);
                },
                child: AppBarTextContainer(
                    'Admin', index == 4 ? Colors.grey.shade300 : Colors.grey),
              ),
              SizedBox(width: 980),
              Consumer<AdminProvider>(
                builder: (context, provider, child) {
                  return Visibility(
                    visible: provider.isSignedIn,
                    child: GestureDetector(
                      onTap: () {
                        provider.adminSignOut();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'logout'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
