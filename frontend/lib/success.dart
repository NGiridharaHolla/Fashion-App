// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Home.dart';
import 'home/home_screen.dart';
import 'home_button.dart';

class Success_page extends StatefulWidget {
  final String title = 'Thank You';

  @override
  State<Success_page> createState() => _Success_page();
}

Color themeColor = const Color(0xFF43D19E);

class _Success_page extends State<Success_page> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "../assets/images/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Payment done successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "The product will be delivered to your address...\n\nClick here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.green, // background
              textColor: Colors.white, // foreground
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
