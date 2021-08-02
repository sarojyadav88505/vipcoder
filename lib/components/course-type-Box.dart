import 'package:flutter/material.dart';
import 'package:vipcoder/const/const.dart';

Widget courseTypeBox(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Chip(
      backgroundColor: primaryColor,
      label: Text(
        "$title",
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ),
  );
}
