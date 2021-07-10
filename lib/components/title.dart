import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

Widget title(String title) {
  return ListTile(
    title: Text(
      "$title",
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
    ),
    trailing: Text("View All"),
  );
}
