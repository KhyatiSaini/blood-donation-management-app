import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required String title,
  required String caption,
  required List<String> points,
}) {
  showDialog(
    context: context,
    builder: (BuildContext buildContext) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 25,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Container(
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  caption,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey.shade700,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 250,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '• ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.blueGrey.shade700,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${points[index]}',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: points.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.redAccent,
              ),
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                'close'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    },
  );
}
