import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';
import 'package:vipcoder/pages/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VipCoder',
      theme: ThemeData(primaryColor: primaryColor),
      initialRoute: '/',
      routes: {
        '/': (_) => DashboardScreen(),
        // '/coursepage': (_) => CoursePage()
      },
    );
  }
}
