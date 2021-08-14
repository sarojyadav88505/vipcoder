import 'package:flutter/material.dart';

String url = "http://192.168.1.14:8000/";
String baseurl = url + "api/";

// Color primaryColor = Color(0xffF5A962);
Color primaryColor = Color(0xff125D98);
Color ancentColor = Color(0xffF5A962);
Color textColor = Color(0xffFDEFEF);

// text Editing Controller Enquiry Section
TextEditingController studentName = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController mobile = new TextEditingController();
TextEditingController address = new TextEditingController();
TextEditingController message = new TextEditingController();
TextEditingController certificateNo = new TextEditingController();

const colorizeColors = [
  Color(0xffFDEFEF),
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 23.0,
  fontFamily: 'Horizon',
);
